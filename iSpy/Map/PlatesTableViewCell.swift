//
//  PlatesTableViewCell.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import MapKit
import CleanroomLogger

protocol PlatesTableViewCellDelegate: class {
    func plateCellExpansionDidChange(_ cell: PlatesTableViewCell)
}

class PlatesTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var plateImageView: UIImageView!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var mapViewHeightConstraint: NSLayoutConstraint!

    weak var delegate: PlatesTableViewCellDelegate?

    var imageName: String? {
        didSet {
            if imageName != nil {
                plateImageView.image = UIImage(named:imageName!)
            }
        }
    }

    var isExpanded: Bool = false {
        didSet {
            adjustCellHeight()
        }
    }

    var found = false {
        didSet {
            if found {
                expandButton.isHidden = false
                expandButton.isEnabled = true
            } else {
                expandButton.isHidden = true
                expandButton.isEnabled = false
            }
        }
    }

    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }

    var location: Location? {
        didSet {
            if let newLocation = location {
            mapView.centerCoordinate = CLLocationCoordinate2D(latitude: newLocation.latitude, longitude: newLocation.longitude)
            let annotation = AnnotationView(frame: CGRect(x: 10, y: 10, width: 10, height: 10), coordinate: mapView.centerCoordinate)
            annotation.backgroundColor = .green
            mapView.addAnnotation(annotation)
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
        if let name = name, selected == true {
            plateImageView.fade(toImageNamed: name, duration: 0.2, completion: nil)
        }
    }

    private func setUpMapView() {
        if let location = location {
            mapView.centerCoordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let annotation = AnnotationView(frame: CGRect(x: 10, y: 10, width: 10, height: 10), coordinate: mapView.centerCoordinate)
            annotation.backgroundColor = .green
            mapView.addAnnotation(annotation)
        }
    }

    private func adjustCellHeight() {

        if isExpanded {
            mapViewHeightConstraint.constant = 131.5
        } else {
            mapViewHeightConstraint.constant = 0
        }

        updateConstraints()
    }

    // MARK: - Actions
    @IBAction func didTapExpandButton(_ sender: Any) {

        adjustCellHeight()

        delegate?.plateCellExpansionDidChange(self)

    }
}
