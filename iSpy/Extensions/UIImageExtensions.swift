//
//  UIImageExtensions.swift
//  ITG
//
//  Created by James, Jonathon (UK - London) on 27/10/2016.
//  Copyright © 2016 com.itg. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    /// Scales an image to the appropriate size for the given view
    convenience init?(view: UIView) {

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if let image = image, let cgImage = image.cgImage {

            // Convert the image to scale
            self.init(cgImage: cgImage, scale: scale, orientation: .up)

        } else {

            return nil
        }
    }
}
