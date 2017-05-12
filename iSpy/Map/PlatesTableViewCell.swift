//
//  PlatesTableViewCell.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import MapKit

class PlatesTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var plateImageView: UIImageView!
    @IBOutlet private weak var mapView: MKMapView!

    var model: PlatesTableViewCellModel? {
        didSet {
            if let name = model?.licensePlate?.name {
                nameLabel.text = name
                plateImageView.image = UIImage(named:name)
            }
            setUpMapView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUpMapView() {
        if let location = model?.licensePlate?.location {
            mapView.centerCoordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let annotation = AnnotationView(frame: CGRect(x: 10, y: 10, width: 10, height: 10), coordinate: mapView.centerCoordinate)
            annotation.backgroundColor = .green
            mapView.addAnnotation(annotation)
        }
    }

}
