//
//  PlatesTableViewCellModel.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import MapKit

//protocol PlatesTableViewCellModelDelegate: class {
//    func plateCellModelExpansionDidChange(_ model: PlatesTableViewCellModel)
//}

struct PlatesTableViewCellModel {

    var licensePlate: LicensePlate

    var isExpanded = false

    let realm = DataManager.defaultRealm()

    var found: Bool {
        get {
            return self.licensePlate.found
        }
        set {
            DataManager.saveChanges {
                licensePlate.found = newValue
            }
        }
    }

    var location: Location? {
        get {
            return self.licensePlate.location
        }
        set {
            DataManager.saveChanges {
                licensePlate.location = newValue
            }
        }
    }

    var imageName: String {
        if found {
            return licensePlate.name
        } else {
            return licensePlate.name + "_bw"
        }
    }

    init(_ plate: LicensePlate) {
        licensePlate = plate
    }

}
