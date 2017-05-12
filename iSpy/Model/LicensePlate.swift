//
//  LicensePlate.swift
//  iSpy
//
//  Created by Joshua Dubey on 30/03/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import MapKit

class LicensePlate: BaseObject {
    dynamic var name = ""
    dynamic var found = false
    dynamic var location: Location?
    dynamic var trip: Trip?
}
