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
    dynamic var isCurrentTrip = false
    dynamic var startDate: Date? = Date()
    dynamic var endData: Date?
    dynamic var player: Player?

    let plates = LinkingObjects(fromType: LicensePlate.self, property: "trip")
}
