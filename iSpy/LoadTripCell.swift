//
//  LoadTripCell.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

class LoadTripCell: UICollectionViewCell {

    typealias Closure = () -> Void

    @IBOutlet private weak var tripNameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var makeCurrentButton: UIButton!

    var deleteClosure: Closure?
    var makeCurrentClossure: Closure?

    var cellModel: LoadTripCellModel? {
        didSet {
            if let model = cellModel {
                tripNameLabel.text = model.tripName()
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func didTapDelete(_ sender: UIButton) {
        deleteClosure!()
    }

    @IBAction func didTapMakeCurrent(_ sender: UIButton) {
        makeCurrentClossure!()
    }

}
