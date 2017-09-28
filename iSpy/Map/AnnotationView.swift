//
//  AnnotationView.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {

    let coordinate: CLLocationCoordinate2D
    var title: String?
    let subtitle: String?

    init(_ coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title =  title
        self.subtitle = subtitle
    }
}
