//
//  LoadTripTableHeaderView.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 28/07/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

class LoadTripTableHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var addTripButton: UIButton!
    @IBOutlet weak var mapView: TripManagementMapView!

    var locations = [Location]() {
        didSet {
            mapView.locations = locations
        }
    }

    @IBAction func addTripTapped(_ sender: UIButton) {

    }
}
