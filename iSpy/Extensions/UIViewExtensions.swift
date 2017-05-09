//
//  UIViewExtensions.swift
//  ITG
//
//  Created by Mitchinson, Jacob (UK - London) on 05/09/2016.
//  Copyright © 2016 com.itg. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    // MARK: AddShadow
    func addShadow() {
        addShadow(path: UIBezierPath(rect: bounds))
    }

    func addShadow(path: UIBezierPath, radius: CGFloat = 5, opacity: Float = 0.2, offset: CGSize = CGSize(width: 0.0, height: -3.0)) {
        layer.masksToBounds = false
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowPath = path.cgPath
    }

    // MARK: CreateCircleView
    func makeCircular() {
        layoutIfNeeded()
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }

    /// Attempts to create a UIImage from the view.
    ///
    /// - returns: The created image or nil.
    func image() -> UIImage? {

        return UIImage(view: self)
    }

    // MARK: - Animations

    /**
     Add a fade animation to the view, lasting one second
     */

    /// Add a fade animation to the view of duration
    ///
    /// - Parameter duration: The duration of the fade.  Default 1 second.
    func addFadeAnimation(duration: CFTimeInterval = 1) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration

        self.layer.add(animation, forKey: kCATransitionFade)
    }

    // MARK: - AddBackgorund
    /**
    Add a background image to the view, sent to the back
    */
    func addBackgroundImage(imageName: String) {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: imageName)
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        self.addSubview(imageViewBackground)
        self.sendSubview(toBack: imageViewBackground)
    }
}
