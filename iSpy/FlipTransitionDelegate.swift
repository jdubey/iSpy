//
//  FlipTransitionDelegate.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 09/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

class FlipTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FlipTransitionAnimator()
    }
}

class FlipTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var originFrame = CGRect.zero

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

    guard let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to) else {
                return
        }

        let containerView = transitionContext.containerView
//        let initialFrame = originFrame
        let finalFrame = transitionContext.finalFrame(for: toViewController)

        if let snapshot = toViewController.view.snapshotView(afterScreenUpdates: true) {
//        snapshot.frame = initialFrame
//        snapshot.layer.cornerRadius = 25
//        snapshot.layer.masksToBounds = true

//            containerView.addSubview(snapshot)

        }
containerView.addSubview(toViewController.view)
//        toViewController.view.isHidden = true
        var fromTransform = CATransform3DMakeRotation(-(CGFloat)(M_PI_2), 0.0, 1.0, 0.0)
        var toTransform = CATransform3DMakeRotation(0.0, 0.0, 1.0, 0.0)

        UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/2, animations: {
                fromViewController.view.layer.transform = fromTransform
            })

            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                toViewController.view.layer.transform = toTransform
            })
        }, completion: { _ in
            fromViewController.view.layer.transform = toTransform
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })

//        UIView.animateKeyframesWithDuration(
//            duration,
//            delay: 0,
//            options: .CalculationModeCubic,
//            animations: {
//                // 2
//                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3, animations: {
//                    fromViewController.view.layer.transform = fromTransform
//                })
//                
//                // 3
//                UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: {
//                    toViewController.view.layer.transform = toTransform
//                })
//                
//                // 4
////                UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
////                    snapshot.frame = finalFrame
////                })
//        },
//            completion: { _ in
//                // 5
////                toVC.view.hidden = false
//                fromViewController.view.layer.transform = toTransform
////                snapshot.removeFromSuperview()
//                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
//        })

    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
}
