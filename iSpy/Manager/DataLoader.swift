//
//  DataLoader.swift
//  iSpy
//
//  Created by Joshua Dubey on 30/03/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class DataLoader: NSObject {

    let states = ["Alabama", "Alaska", "Arizona"]

    func loadStateData(with realm: Realm, trip: Trip) {

        do {
            try realm.write {

                states.forEach { stateName in
                    let licensePlate = LicensePlate()
                    licensePlate.name = stateName
                    licensePlate.trip = trip
                    realm.add(licensePlate)
                }
            }
        } catch {
            print("Realm write error: \(error)")
        }
    }
}
