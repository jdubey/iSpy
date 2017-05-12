//
//  LoadTripCell.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

class LoadTripCell: UITableViewCell {

    @IBOutlet private weak var currentTripImageView: UIImageView!
    @IBOutlet private weak var tripNameLabel: UILabel!

    var cellModel: LoadTripCellModel? {
        didSet {
            if let model = cellModel {
                tripNameLabel.text = model.tripName()
                currentTripImageView.backgroundColor = model.isCurrentTrip() ? .green : .red
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
