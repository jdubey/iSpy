//
//  RotaryWheel.swift
//  RotatingWheel
//
//  Created by Dubey, Josh (UK - London) on 26/09/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import CoreGraphics

class RotaryWheel: UIControl {

    static var deltaAngle: CGFloat = 0.0
    let minAlphaValue: CGFloat = 0.6
    let maxAlphaValue: CGFloat = 1.0

    weak var delegate: RotaryProtocol?
    var container = UIView()
    var numberOfSections = 0
    var startTransform = CGAffineTransform.identity
    var sectors = [Sector]()
    var currentSector = 0

    convenience init(frame: CGRect, delegate: RotaryProtocol, sectionsNumber: Int) {
        self.init(frame: frame)
        self.delegate = delegate
        self.numberOfSections = sectionsNumber
        drawWheel()

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(turnWheel(gestureRecognizer:)))
        gestureRecognizer.delegate = self
        addGestureRecognizer(gestureRecognizer)
    }

    private func drawWheel() {
        container = UIView(frame: bounds)
        let angleSize: CGFloat = 2 * .pi / CGFloat(numberOfSections)

        for index in 0...numberOfSections - 1 {
            let imageView = UIImageView(image: #imageLiteral(resourceName: "segment"))
            imageView.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
            imageView.layer.position = CGPoint(x: container.bounds.width / 2.0 - container.frame.origin.x, y: container.bounds.height / 2.0 - container.frame.origin.y)
            imageView.transform = CGAffineTransform(rotationAngle: angleSize * CGFloat(index))
            imageView.alpha = minAlphaValue
            imageView.tag = index
            if index == 0 {
                imageView.alpha = maxAlphaValue
            }

            let sectorImage = UIImage(named: "icon\(index)")
            let sectorView = UIImageView(image: sectorImage)
            sectorView.frame = CGRect(x: 12, y: 15, width: 40, height: 40)
            imageView.addSubview(sectorView)
            container.addSubview(imageView)
        }

        container.isUserInteractionEnabled = false
        addSubview(container)

        if numberOfSections % 2 == 0 {
            buildSectorsEven()
        } else {
            buildSectorOdd()
        }

        let bgImageView = UIImageView(image: #imageLiteral(resourceName: "bg"))
        bgImageView.frame = self.bounds
        addSubview(bgImageView)
        delegate?.wheelDidChangeValue(currentSector)

        let mask = UIImageView(image: #imageLiteral(resourceName: "centerButton"))
        mask.bounds = CGRect(x: 0, y: 0, width: 58, height: 58)
        mask.center = container.center
        mask.center = CGPoint(x: mask.center.x, y: mask.center.y + 3)
        addSubview(mask)
    }

    private func buildSectorOdd() {

        // Define sector length
        let fanWidth: CGFloat = .pi * 2 / CGFloat(numberOfSections)

        // Set initial midpoint
        var mid: CGFloat = 0.0

        // When calculating the min and max values, you add/subtract half of the sector width to get the correct values.
        // Remember that your range is from -pi to pi, so everything has to be "normalized" between those values. If a value is
        // greater than pi or –pi, that means you’ve changed quadrant. Since you’ve populated the wheel clockwise, you have to
        // take into account when the minimum value is less than pi, and in that case change the sign of the midpoint.

        for index in 0...numberOfSections - 1 {
            let midValue = mid
            let minValue = mid - (fanWidth / 2)
            let maxValue = mid + (fanWidth / 2)

            mid -= fanWidth
            if mid < -.pi {
                mid = -mid
                mid -= fanWidth
            }

            let sector = Sector(minValue: minValue, maxValue: maxValue, midValue: midValue, sector: index)
            sectors.append(sector)
        }
    }

    private func buildSectorsEven() {
        // Define sector length
        let fanWidth: CGFloat = .pi * 2 / CGFloat(numberOfSections)

        // Set initial midpoint
        var mid: CGFloat = 0.0

        // As you'll notice, the basic logic is the same as building an odd number of sectors. The main difference is that in
        // this instance pi (or -pi if you move counterclockwise) is not a max or min point, but it coincides with a midpoint.
        // So you have to check if, by subtracting the sector width from the max value, you pass the -pi limit, and if you do,
        // set the min value as positive.
        for index in 0...numberOfSections - 1 {
            var minValue = mid - fanWidth / 2
            let maxValue = mid + fanWidth / 2
            var midValue = mid

            if maxValue - fanWidth < -.pi {
                mid = .pi
                midValue = mid
                minValue = CGFloat(fabsf(Float(maxValue)))
            }
            mid -= fanWidth
            let sector = Sector(minValue: minValue, maxValue: maxValue, midValue: midValue, sector: index)
            sectors.append(sector)
        }
    }

    @objc func turnWheel(gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            getSectorByValue(value: currentSector)?.alpha = minAlphaValue
            let touchPoint = gestureRecognizer.location(in: self)
            let dx = touchPoint.x - container.center.x
            let dy = touchPoint.y - container.center.y
            RotaryWheel.deltaAngle = atan2(dx, dy)
            startTransform = container.transform
        case .changed:
            let point = gestureRecognizer.location(in: self)
            let distance = calculateDistanceFromCenter(point)
            if !shouldRotate(distance) { return }
            let dx = point.x - container.center.x
            let dy = point.y - container.center.y
            let angle = atan2(dx, dy)
            let angleDiff = RotaryWheel.deltaAngle - angle
            container.transform = startTransform.rotated(by: angleDiff)
        case .ended:
            let radians: CGFloat = CGFloat(atan2f(Float(container.transform.b), Float(container.transform.a)))
            var newVal: CGFloat = 0.0
            sectors.forEach({ (sector) in
                if sector.minValue > 0 && sector.maxValue < 0 {
                    if sector.maxValue > radians || sector.minValue < radians {
                        if radians > 0 {
                            newVal = radians - .pi
                        } else {
                            newVal = .pi + radians
                        }
                        currentSector = sector.sector
                    }
                } else if radians > sector.minValue && radians < sector.maxValue {
                    newVal = radians - sector.midValue
                    currentSector = sector.sector
                }
            })

            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.2)
            let transform = container.transform.rotated(by: -newVal)
            container.transform = transform
            UIView.commitAnimations()
            delegate?.wheelDidChangeValue(currentSector)
            getSectorByValue(value: currentSector)?.alpha = maxAlphaValue
        default:
            break
        }
    }

    fileprivate func calculateDistanceFromCenter(_ point: CGPoint) -> CGFloat {
        let dx = point.x - container.center.x
        let dy = point.y - container.center.y
        return CGFloat(sqrt(dx*dx + dy*dy))
    }

    fileprivate func shouldRotate(_ distance: CGFloat) -> Bool {
        if distance < 40 || distance > 100 {
            return false
        }
        return true
    }

    private func getSectorByValue(value: Int) -> UIView? {
        return container.subviews.filter({return $0.tag == value}).first
    }
}

extension RotaryWheel: UIGestureRecognizerDelegate {

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let touchPoint = gestureRecognizer.location(in: self)
        let distance = calculateDistanceFromCenter(touchPoint)
        return shouldRotate(distance)
    }

}
