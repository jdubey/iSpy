//
//  LoginViewController.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var newTripButton: UIButton!
    @IBOutlet weak var loadTripButton: UIButton!

    var trip: Trip?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTripButton.setTitle("New Trip", for: .normal)
        loadTripButton.setTitle("Load Trip", for: .normal)
    }

    // MARK: - Actions
    @IBAction func newTripTapped(_ sender: UIButton) {
        trip = TripService.defaultService.createTrip()
    }

    @IBAction func loadTripTapped(_ sender: Any) {
        let loadedTrip = TripService.defaultService.fetchTrip()
        print("Trip = \(String(describing: loadedTrip))")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.loginViewController.platesViewController.identifier {
            if let platesViewController = segue.destination as? PlatesViewController {
                platesViewController.trip = trip
            }
        }
    }

}
