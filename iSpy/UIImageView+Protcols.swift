//
//  UIImageView+Protcols.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 15/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import Foundation
import UIKit

protocol Animations {
    func fade(toImageNamed name: String, duration: Double, completion: ((Bool) -> Void)?)
}

extension UIImageView: Animations {
    func fade(toImageNamed name: String, duration: Double, completion: ((Bool) -> Void)?) {
        let toImage = UIImage(named: name)
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.image = toImage
        }, completion: completion)
    }
}
