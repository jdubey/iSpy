//
//  TripManagementMapView.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 22/06/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import MapKit

class TripManagementMapView: UIView {

    var locations = [Location]() {
        didSet {
            setUpMapView()
        }
    }

    lazy var mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    override func didMoveToSuperview() {
        setUpMapView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        if mapView.superview == nil {
            addSubview(mapView)
            var constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[mapView]-|", options: .alignAllCenterY, metrics: nil, views: ["mapView": mapView])
            constraints.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "V:|-[mapView]-|", options: .alignAllCenterY, metrics: nil, views: ["mapView": mapView]))
            NSLayoutConstraint.activate(constraints)
        }
    }

    private func setUpMapView() {
        if locations.count > 0 {
        let firstCoord =  CLLocationCoordinate2D(latitude: locations[0].latitude, longitude: locations[0].longitude)
        mapView.setCenter(firstCoord, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegionMake(firstCoord, span)
        let regionThatFits = mapView.regionThatFits(region)
        mapView.setRegion(regionThatFits, animated: false)
        }

        locations.forEach { location in
            let coord = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let annotation = AnnotationView(frame: CGRect(x: 10, y: 10, width: 10, height: 10), coordinate: coord)
            annotation.backgroundColor = .green
            mapView.addAnnotation(annotation)

        }
    }

}
