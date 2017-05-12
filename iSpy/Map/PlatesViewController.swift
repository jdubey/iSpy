//
//  PlatesViewController.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift
import CleanroomLogger

class PlatesViewController: UIViewController {

    @IBOutlet weak var platesTableView: UITableView!

    var trip: Trip?

    fileprivate let realm = DataManager.defaultRealm()

    var plateModels: [PlatesTableViewCellModel]?

    override func viewDidLoad() {
        super.viewDidLoad()

        plateModels = trip?.plates.map { PlatesTableViewCellModel($0) }

        platesTableView.delegate = self
        platesTableView.dataSource = self

    }
}

// MARK: - UITableViewDataSource
extension PlatesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let plates = plateModels else {
            return 0
        }

        return plates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.platesTableViewCell.identifier) as? PlatesTableViewCell).require()

        cell.model = plateModels?[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PlatesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let plateModel = plateModels?[indexPath.row] {
            let location = LocationManager.defaultManager().currentLocation()
            realm.beginWrite()
            plateModel.licensePlate?.location = location
            DataManager.safeWrite()
            Log.debug?.message("License plate = \(plateModel.licensePlate)")
        }
    }
}
