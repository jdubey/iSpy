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
    func didTapShowDetail(_ cell: PlatesTableViewCell)
}

class PlatesTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var plateImageView: UIImageView!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet weak var showTripButton: UIButton!
    @IBOutlet weak var mapViewHeightConstraint: NSLayoutConstraint!

    weak var delegate: PlatesTableViewCellDelegate?

    var imageName: String? {
        didSet {
            if imageName != nil {
                plateImageView.image = UIImage(named:imageName!)
            }
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

    private func showButton(_ shouldShow: Bool) {
        if shouldShow {
            showTripButton.isHidden = false
            showTripButton.isEnabled = true
        } else {
            showTripButton.isHidden = true
            showTripButton.isEnabled = false
        }
    }

    // MARK: - Actions
    @IBAction func didTapExpandButton(_ sender: Any) {

    }
}
