//
//  PlatesTableViewCellModel.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import MapKit

class PlatesTableViewCellModel: NSObject {

    var licensePlate: LicensePlate?
    var isExpanded = false

    let realm = DataManager.defaultRealm()
    var found: Bool {
        get {
            if let found = self.licensePlate?.found {
                return found
            }
            return false
        }
        set {
            realm.beginWrite()
            licensePlate?.found = newValue
            DataManager.safeWrite()
        }
    }

    var location: Location? {
        get {
            return self.licensePlate?.location
        }
        set {
            realm.beginWrite()
            licensePlate?.location = newValue
            DataManager.safeWrite()
        }
    }

    convenience init(_ plate: LicensePlate?) {
        self.init()
        licensePlate = plate
    }

}

extension PlatesTableViewCellModel : MKMapViewDelegate {

}
