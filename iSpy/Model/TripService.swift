//
//  TripService.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class TripService: NSObject {

    static var defaultService = TripService()

    private var realm = DataManager.defaultRealm()

    func createTrip() -> Trip? {

        let trip: Trip? = Trip.createInRealm(realm: realm)

        if let trip = trip {
            DataLoader().loadStateData(with: realm, trip: trip)
        }
        return trip
    }

    func fetchTrip() -> Trip? {
        return realm.objects(Trip.self).last
    }
}
