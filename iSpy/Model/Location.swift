//
//  Location.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class Location: BaseObject {
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    dynamic var timestamp: Date?

    override var description: String {
        return "Latitude: \(latitude) \n Longitude: \(longitude)"
    }
}
