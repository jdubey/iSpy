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

    convenience init(_ plate: LicensePlate?) {
        self.init()
        licensePlate = plate
    }

}

extension PlatesTableViewCellModel : MKMapViewDelegate {

}
