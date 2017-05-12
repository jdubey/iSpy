//
//  LoadTripViewController.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import Rswift
import Require

class LoadTripViewController: UIViewController {

    @IBOutlet weak var tripTableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!

    fileprivate var trips = TripService.defaultService.fetchAllTrips().sorted(byKeyPath: "isCurrentTrip", ascending: false).map { LoadTripCellModel(trip: $0) }

    override func viewDidLoad() {
        super.viewDidLoad()

        tripTableView.delegate = self
        tripTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Actions
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension LoadTripViewController : UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tripCell = (tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.loadTripCell.identifier, for: indexPath) as? LoadTripCell).require()
        tripCell.cellModel = trips[indexPath.row]
        return tripCell
    }
}

// MARK: - UITableViewDelegate
extension LoadTripViewController : UITableViewDelegate {

}
