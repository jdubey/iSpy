//
//  PlatesViewController.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class PlatesViewController: UIViewController {

    @IBOutlet weak var platesTableView: UITableView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var speedView: SpeedView!

    lazy var trip: Trip? = {
        return TripService.fetchCurrentTrip()
    }()

    fileprivate let realm = DataManager.defaultRealm()

    var plateModels = [PlatesTableViewCellModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        speedView.setNeedsDisplay()
        addHomeButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        trip = TripService.fetchCurrentTrip()
        if let plates = trip?.plates {
            plateModels = plates.map ({ PlatesTableViewCellModel($0) })
        }
        tripNameLabel.text = trip?.name
        platesTableView.reloadData()
        let numberFound = plateModels.filter { (model) -> Bool in
            return model.found
        }.count
        speedView.speed = CGFloat(numberFound)
    }

    private func configureTableView() {
        platesTableView.delegate = self
        platesTableView.dataSource = self
        platesTableView.tableFooterView = UIView()

        platesTableView.rowHeight = UITableViewAutomaticDimension
        platesTableView.estimatedRowHeight = 50
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.platesViewController.tripShowDetail.identifier,
            let tripDetailViewController = segue.destination as? TripDetailViewController {
            tripDetailViewController.licensePlates = plateModels.flatMap {$0.licensePlate}
        }
    }
}

// MARK: - UITableViewDataSource
extension PlatesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plateModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "PlatesTableViewCell") as? PlatesTableViewCell).require()

        configure(cell, with: plateModels[indexPath.row])
        return cell
    }

    private func configure(_ cell: PlatesTableViewCell, with model: PlatesTableViewCellModel) {
        cell.delegate = self
        cell.name = model.licensePlate.name
        cell.found = model.found
        cell.imageName = model.imageName
        cell.location = model.location
    }
}

// MARK: - UITableViewDelegate
extension PlatesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var plateModel = plateModels[indexPath.row]
        let location = LocationManager.defaultManager().currentLocation()
        plateModel.location = location
        if plateModel.found == false {
            speedView.incrementSpeed()
        }
        plateModel.found = true
        if let cell = tableView.cellForRow(at: indexPath) as? PlatesTableViewCell {
            cell.location = location
        }
    }
}

// MARK: - PlatesTableViewCellDelegate
extension PlatesViewController: PlatesTableViewCellDelegate {
    func didTapShowDetail(_ cell: PlatesTableViewCell) {
        performSegue(withIdentifier: R.segue.platesViewController.tripShowDetail.identifier, sender: self)
    }

}
