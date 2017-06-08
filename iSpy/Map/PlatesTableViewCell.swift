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
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var mapViewHeightConstraint: NSLayoutConstraint!

    var model: PlatesTableViewCellModel? {
        didSet {
            if let name = model?.licensePlate?.name {
                nameLabel.text = name
                var imageName = name + "_bw"
                if let found = model?.found, found == true {
                    imageName = name
                    expandButton.isHidden = false
                    expandButton.isEnabled = true
                }
                plateImageView.image = UIImage(named:imageName)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        expandButton.isHidden = true
        expandButton.isEnabled = false
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.selectionStyle = .none

        setUpMapView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if let name = model?.licensePlate?.name, selected == true {
            plateImageView.fade(toImageNamed: name, duration: 0.2, completion: nil)
        }
    }

    func setUpMapView() {
        if let location = model?.licensePlate?.location {
            mapView.centerCoordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let annotation = AnnotationView(frame: CGRect(x: 10, y: 10, width: 10, height: 10), coordinate: mapView.centerCoordinate)
            annotation.backgroundColor = .green
            mapView.addAnnotation(annotation)
        }
    }

    // MARK: - Actions
    @IBAction func didTapExpandButton(_ sender: Any) {
        guard let model = model else {
            return
        }

        if !model.isExpanded {
//            setUpMapView()
            mapViewHeightConstraint.constant = 131.5
//            UIView.animate(withDuration: 0.5, animations: {
//                self.layoutIfNeeded()
//            })
//            let rect = self.frame
//            let newRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height + 131.5)
//            self.frame = newRect
        } else {
            mapViewHeightConstraint.constant = 0
        }

        updateConstraints()

        model.isExpanded = !model.isExpanded
    }
}
