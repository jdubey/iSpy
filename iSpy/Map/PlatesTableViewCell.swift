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
            showButton(found)
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
                setUpMapView(newLocation)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        Log.debug?.message("\(String(describing: name?.description)) isSelected = \(selected)")

        if let name = name, found == false, selected == true {
            plateImageView.fade(toImageNamed: name, duration: 0.2, completion: nil)
            showButton(true)
        }
    }

    private func setUpMapView(_ location: Location) {
        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegionMake(mapView.centerCoordinate, span)

        let regionThatFits = mapView.regionThatFits(region)
        mapView.region = regionThatFits
        let annotation = AnnotationView(frame: CGRect(x: 10, y: 10, width: 10, height: 10), coordinate: mapView.centerCoordinate)
        annotation.backgroundColor = .green
        mapView.addAnnotation(annotation)
    }

    private func showButton(_ shouldShow: Bool) {
        Log.debug?.message("Should show \(String(describing: name)) = \(shouldShow)")
        if shouldShow {
            expandButton.isHidden = false
            expandButton.isEnabled = true
        } else {
            expandButton.isHidden = true
            expandButton.isEnabled = false
        }
    }

    private func adjustCellHeight() {

        if isExpanded {
            mapViewHeightConstraint.constant = 250
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
