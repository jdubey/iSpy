//
//  AnnotationView.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: UIView, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    override init(frame: CGRect) {
        coordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        coordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        super.init(coder: coder)
    }

    convenience init(frame: CGRect, coordinate: CLLocationCoordinate2D) {
        self.init(frame: frame)
        self.coordinate = coordinate
    }

}
