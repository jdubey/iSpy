//
//  CALayerExtensions.swift
//  ITG
//
//  Created by James, Jonathon (UK - London) on 26/10/2016.
//  Copyright © 2016 com.itg. All rights reserved.
//

import Foundation
import QuartzCore

extension CALayer {

    func bringSublayerToFront(layer: CALayer) {

        layer.removeFromSuperlayer()
        self.insertSublayer(layer, at: UInt32(self.sublayers?.count ?? 0))
    }

    func sendSublayerToBack(layer: CALayer) {

        layer.removeFromSuperlayer()
        self.insertSublayer(layer, at: UInt32(0))
    }
}
