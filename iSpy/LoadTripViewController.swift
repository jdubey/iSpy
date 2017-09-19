//
//  LoadTripViewController.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import Require
import Realm
import MapKit

class LoadTripViewController: UIViewController {

    @IBOutlet weak var tripTableView: UITableView!
    //    @IBOutlet weak var newTripButton: UIButton!
//    @IBOutlet weak var mapView: TripManagementMapView!

    fileprivate var trips = TripService.defaultService.fetchAllTrips().map { LoadTripCellModel(trip: $0) }

    var mkview = MKMapView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let currentTrip = TripService.defaultService.fetchCurrentTrip() {
//            mapView.locations = currentTrip.locations()
//        }

        configureTableView()
    }

    private func configureTableView() {

        tripTableView.delegate = self
        tripTableView.dataSource = self

        let headerNib = UINib(nibName: "LoadTripTableHeaderView", bundle: nil)
//        tripTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "LoadTripTableHeaderView")
//
//        let headerView = (tripTableView.dequeueReusableHeaderFooterView(withIdentifier: "LoadTripTableHeaderView") as? LoadTripTableHeaderView).require()

//        tripTableView.tableHeaderView = headerView

    }

//    private func setupMapView() {
//        if let currentTrip = TripService.defaultService.fetchCurrentTrip() {
//            var allConstraints = [NSLayoutConstraint]()
//            mapView.locations = currentTrip.locations()
//            mkview.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview(mkview)
//            let hconstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[mkview]-|", options: .alignAllCenterY, metrics: nil, views: ["mkview": mkview])
//            let vconstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[mkview]-|", options: .alignAllCenterX, metrics: nil, views: ["mkview": mkview])
//            allConstraints += hconstraints
//            allConstraints += vconstraints
//        } else {
//            mapView.isHidden = true
//        }
//    }

    // MARK: - Actions
    @IBAction func newTripTapped(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let createTripViewController = (mainStoryBoard.instantiateViewController(withIdentifier: "CreateTripViewController") as? CreateTripViewController).require()
        createTripViewController.delegate = self
        present(createTripViewController, animated: true, completion: nil)
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

        let tripCell = (tableView.dequeueReusableCell(withIdentifier: "LoadTripCell", for: indexPath) as? LoadTripCell).require()
        tripCell.cellModel = trips[indexPath.row]
        return tripCell
    }

}

// MARK: - UITableViewDelegate
extension LoadTripViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedTrip = trips[indexPath.row].trip
        setCurrentTrip(selectedTrip)
//        mapView.locations = selectedTrip.locations()
    }

    func setCurrentTrip(_ trip: Trip) {
        let currentTrip = TripService.defaultService.fetchCurrentTrip()
        DataManager.defaultRealm().beginWrite()
        trip.isCurrentTrip = true
        currentTrip?.isCurrentTrip = false
        _ = DataManager.safeWrite()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 169
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerNib = UINib(nibName: "LoadTripTableHeaderView", bundle: nil)
        let headerView = headerNib.instantiate(withOwner: self, options: nil)[0] as? UIView
        return headerView
    }

}

extension LoadTripViewController: CreateTripViewControllerDelegate {
    func didCreateTrip(_ createTripViewController: CreateTripViewController) {
        dismiss(animated: true, completion: nil)
        tripTableView.reloadData()
    }
}
