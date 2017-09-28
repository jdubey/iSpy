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

    @IBOutlet weak var tripCollectionView: UICollectionView!

    fileprivate var trips = TripService.defaultService.fetchAllTrips().map { LoadTripCellModel(trip: $0) }

    fileprivate lazy var currentTrip: Trip? = {
        return TripService.defaultService.fetchCurrentTrip()
    }()

    var mkview = MKMapView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TRIPS"
        configureTableView()
        addHomeButton()
    }

    private func configureTableView() {
        tripCollectionView.delegate = self
        tripCollectionView.dataSource = self

        let nib = UINib(nibName: "LoadTripCell", bundle: nil)
        tripCollectionView.register(nib, forCellWithReuseIdentifier: "LoadTripCell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewcontroller = segue.destination as? TripDetailViewController {
            if let currentTrip = currentTrip {
                viewcontroller.licensePlates = currentTrip.plates.map { $0 }
            }
        }
    }

    // MARK: - Actions
    @IBAction func newTripTapped(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let createTripViewController = (mainStoryBoard.instantiateViewController(withIdentifier: "CreateTripViewController") as? CreateTripViewController).require()
        createTripViewController.delegate = self
        present(createTripViewController, animated: true, completion: nil)
    }

}

// MARK: - UITableViewDataSource
extension LoadTripViewController : UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadTripCell", for: indexPath) as? LoadTripCell {
        cell.cellModel = trips[indexPath.row]
        cell.deleteClosure = {
            print("Delete trip")
        }
            return cell
        }
//        cell.backgroundColor = .red
        return UICollectionViewCell()
    }
}

extension LoadTripViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let tripDetailController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TripDetailViewController") as? TripDetailViewController {
            if let currentTrip = currentTrip {
                tripDetailController.licensePlates = currentTrip.plates.map { $0 }
                present(tripDetailController, animated: true, completion: nil)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 150)
    }

}

extension LoadTripViewController: CreateTripViewControllerDelegate {
    func didCreateTrip(_ createTripViewController: CreateTripViewController) {
        dismiss(animated: true, completion: nil)
        tripCollectionView.reloadData()
    }
}
