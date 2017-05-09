//
//  UIColorExtensions.swift
//  Syngenta
//
//  Created by Dubey, Josh (UK - London) on 08/12/2016.
//  Copyright © 2016 Deloitte LLC. All rights reserved.
//

import UIKit

extension UIColor {

    // MARK: - Convenience Initializers

    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.00)
    }

    convenience init(argbHex hex: Int64) {

        let alpha   = CGFloat((hex & 0xFF000000) >> 24) / 255.0
        let red     = CGFloat((hex & 0x00FF0000) >> 16) / 255.0
        let green   = CGFloat((hex & 0x0000FF00) >> 8)  / 255.0
        let blue    = CGFloat( hex & 0x000000FF)        / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    convenience init(rgbaHex hex: Int64) {

        let red   = CGFloat((hex & 0xFF000000) >> 24) / 255.0
        let green = CGFloat((hex & 0x00FF0000) >> 16) / 255.0
        let blue  = CGFloat((hex & 0x0000FF00) >> 8)  / 255.0
        let alpha = CGFloat( hex & 0x000000FF)        / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
