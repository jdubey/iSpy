//
//  UIViewControllerExtensions.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 27/09/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

extension UIViewController {

    func addHomeButton() {
        var homeButton = UIButton(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        homeButton.setImage(#imageLiteral(resourceName: "icons8-Home-50"), for: .normal)
        homeButton.addTarget(self, action: #selector(goHome(_:)), for: .touchUpInside)
        view.addSubview(homeButton)
    }

    @objc func goHome(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
