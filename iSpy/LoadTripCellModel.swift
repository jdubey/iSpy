//
//  LoadTripCellModel.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import Foundation

struct LoadTripCellModel {
    let trip: Trip

    func tripName() -> String {
        return trip.name
    }

    func isCurrentTrip() -> Bool {
        return trip.isCurrentTrip
    }
}
