//
//  PlatesTableViewCell.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import MapKit

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

    var mapviewDidInit = false

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

    var location: Location?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if let name = name, found == false, selected == true {
            plateImageView.fade(toImageNamed: name, duration: 0.2, completion: nil)
            showButton(true)
        }
    }

    private func setUpMapView(_ location: Location) {
        let center = CLLocationCoordinate2DMake(location.latitude, location.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegionMake(center, span)

        mapView.setRegion(region, animated: true)

        let annotation = AnnotationView(frame: CGRect(x: 10, y: 10, width: 10, height: 10), coordinate: center)
        annotation.backgroundColor = .green
        mapView.addAnnotation(annotation)

        mapviewDidInit = true
    }

    private func showButton(_ shouldShow: Bool) {
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

    override func updateConstraints() {
        super.updateConstraints()
        if let location = location, mapviewDidInit == false {
            setUpMapView(location)
        }
    }

    // MARK: - Actions
    @IBAction func didTapExpandButton(_ sender: Any) {

        delegate?.plateCellExpansionDidChange(self)

    }

    override func prepareForReuse() {
        mapviewDidInit = false
    }
}
