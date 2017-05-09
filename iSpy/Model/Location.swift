//
//  Location.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class Location: Object {
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0
    dynamic var timestamp: Date?
}
