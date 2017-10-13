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

    let reuseIdentifer = "Annotaton"

    var licensePlates = [LicensePlate]() {
        didSet {
            setUpMapView()
        }
    }

    var highlightPlate: LicensePlate?

    lazy var mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
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
        let locations = licensePlates.flatMap({$0.location})

        for (index, location) in locations.enumerated() {
            if index == 0 {
                let firstCoord =  CLLocationCoordinate2D(latitude: locations[0].latitude, longitude: locations[0].longitude)
                mapView.setCenter(firstCoord, animated: true)
                let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
                let region = MKCoordinateRegionMake(firstCoord, span)
                let regionThatFits = mapView.regionThatFits(region)
                mapView.setRegion(regionThatFits, animated: false)
            } else {
                let coord = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                let annotation = Annotation(coord, title: licensePlates[index].name)
                mapView.addAnnotation(annotation)
            }
        }
    }
}

extension TripManagementMapView: MKMapViewDelegate {
    fileprivate func configureAnnotation(_ annotationView: MKAnnotationView, _ annotation: MKAnnotation) {
        annotationView.annotation = annotation
        annotationView.image = #imageLiteral(resourceName: "icons8-Car-48")
        annotationView.canShowCallout = true
        let calloutLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        calloutLabel.text = annotation.title!
        annotationView.leftCalloutAccessoryView = calloutLabel
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifer) {
            configureAnnotation(annotationView, annotation)
            return annotationView
        } else {
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifer)
            configureAnnotation(annotationView, annotation)
            return annotationView
        }
    }
}
