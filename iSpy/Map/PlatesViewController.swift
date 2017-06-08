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

    lazy var trip: Trip? = {
        return TripService.defaultService.fetchCurrentTrip()
    }()

    fileprivate let realm = DataManager.defaultRealm()

    var plateModels = [PlatesTableViewCellModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = trip?.name

        if let plates = trip?.plates {
            plateModels = plates.map ({ PlatesTableViewCellModel($0) })
        }

        plateModels.forEach { model in
            model.delegate = self
        }

        platesTableView.delegate = self
        platesTableView.dataSource = self
        platesTableView.tableFooterView = UIView()
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
        let cell = (tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.platesTableViewCell.identifier) as? PlatesTableViewCell).require()

        cell.model = plateModels[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PlatesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plateModel = plateModels[indexPath.row]
            let location = LocationManager.defaultManager().currentLocation()
            plateModel.location = location
            plateModel.found = true
            Log.debug?.message("License plate = \(String(describing: plateModel.licensePlate))")
            tableView.reloadRows(at: [indexPath], with: .fade)

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if plateModels[indexPath.row].isExpanded {
            return 200
        }
        return 50
    }
}

// MARK: - PlatesTableViewCellModelDelegate
extension PlatesViewController: PlatesTableViewCellModelDelegate {
    func plateCellModelExpansionDidChange(_ model: PlatesTableViewCellModel) {
        platesTableView.beginUpdates()
        platesTableView.endUpdates()
    }

}
