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

    static private var realm = DataManager.defaultRealm()

    static func createTrip() -> Trip? {

        if let currentTrip = fetchCurrentTrip() {
            DataManager.saveChanges {
                currentTrip.isCurrentTrip = false
            }
        }

        let trip: Trip? = Trip.createInRealm(realm: realm)

        if let trip = trip {
            DataLoader().loadStateData(with: realm, trip: trip)
        }

        return trip
    }

    static func fetchTrip() -> Trip? {
        return realm.objects(Trip.self).last
    }

    static func fetchCurrentTrip() -> Trip? {
        return DataManager.defaultRealm().objects(Trip.self).filter("isCurrentTrip == true").first
    }

    static func fetchAllTrips() -> Results<Trip> {
        let sortProperties = [SortDescriptor(keyPath: "isCurrentTrip", ascending: false), SortDescriptor(keyPath: "name", ascending: true)]

        return DataManager.defaultRealm().objects(Trip.self).sorted(by: sortProperties)
    }

}
