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

        configureTableView()

    }

    private func configureTableView() {
        platesTableView.delegate = self
        platesTableView.dataSource = self
        platesTableView.tableFooterView = UIView()

        platesTableView.rowHeight = UITableViewAutomaticDimension
        platesTableView.estimatedRowHeight = 50
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

        configure(cell, with: plateModels[indexPath.row])
        return cell
    }

    private func configure(_ cell: PlatesTableViewCell, with model: PlatesTableViewCellModel) {
        cell.delegate = self
        cell.name = model.licensePlate.name
        cell.isExpanded = model.isExpanded
        cell.found = model.found
        cell.imageName = model.imageName
    }
}

// MARK: - UITableViewDelegate
extension PlatesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var plateModel = plateModels[indexPath.row]
            let location = LocationManager.defaultManager().currentLocation()
            plateModel.location = location
            plateModel.found = true
            Log.debug?.message("License plate = \(String(describing: plateModel.licensePlate))")
            tableView.reloadRows(at: [indexPath], with: .fade)

    }
}

// MARK: - PlatesTableViewCellDelegate
extension PlatesViewController: PlatesTableViewCellDelegate {
    func plateCellExpansionDidChange(_ cell: PlatesTableViewCell) {

        if let index = platesTableView.indexPath(for: cell)?.row {
            plateModels[index].isExpanded = !plateModels[index].isExpanded
            cell.isExpanded = plateModels[index].isExpanded
        }

        platesTableView.beginUpdates()
        platesTableView.endUpdates()
    }

}
