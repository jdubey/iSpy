//
//  Sector.swift
//  RotatingWheel
//
//  Created by Dubey, Josh (UK - London) on 26/09/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import Foundation
import CoreGraphics

struct Sector: CustomStringConvertible {
    let minValue: CGFloat
    let maxValue: CGFloat
    let midValue: CGFloat
    let sector: SectorType

    var description: String {
        return "\(sector) | \(minValue) \(midValue) \(maxValue)"
    }
}
