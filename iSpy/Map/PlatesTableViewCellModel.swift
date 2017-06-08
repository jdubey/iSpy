//
//  PlatesTableViewCellModel.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import MapKit

protocol PlatesTableViewCellModelDelegate: class {
    func plateCellModelExpansionDidChange(_ model: PlatesTableViewCellModel)
}

class PlatesTableViewCellModel: NSObject {

    var licensePlate: LicensePlate?
    weak var delegate: PlatesTableViewCellModelDelegate?

    var isExpanded = false {
        didSet {
            delegate?.plateCellModelExpansionDidChange(self)
        }
    }

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
            _ = DataManager.safeWrite()
        }
    }

    var location: Location? {
        get {
            return self.licensePlate?.location
        }
        set {
            realm.beginWrite()
            licensePlate?.location = newValue
            _ = DataManager.safeWrite()
        }
    }

    convenience init(_ plate: LicensePlate?) {
        self.init()
        licensePlate = plate
    }

}

extension PlatesTableViewCellModel : MKMapViewDelegate {

}
