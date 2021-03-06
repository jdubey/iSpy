//
//  Trip.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import Foundation
import RealmSwift

class Trip: BaseObject {
    dynamic var name = ""
    dynamic var isCurrentTrip = true
    dynamic var startDate: Date? = Date()
    dynamic var endData: Date?
    dynamic var player: Player?

    let plates = LinkingObjects(fromType: LicensePlate.self, property: "trip")

    func locations() -> [Location] {
        let platesWithLocations = plates.filter("location != nil")
        return platesWithLocations.map {$0.location.require()}
    }
}
