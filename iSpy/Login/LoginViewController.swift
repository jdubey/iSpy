//
//  LoginViewController.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

enum ButtonTag: Int {
    case trip = 0
    case trips = 1
    case none = 2
}

class LoginViewController: UIViewController {

    @IBOutlet weak var tripButton: UIButton!
    @IBOutlet weak var tripsButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!

    var viewControllers = [UIViewController?]()
    var selectedIndex = ButtonTag.none.rawValue

    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.distribution = .fillEqually
        stackView.alignment = .center

        configureViewControllers()
        configureButtuns()

    }

    private func shouldShowCreateTrip() -> Bool {
        if TripService.fetchCurrentTrip() == nil {
            showCreateTrip()
            return true
        }

        return false
    }

    private func showCreateTrip() {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let createTripViewController = (mainStoryBoard.instantiateViewController(withIdentifier: "CreateTripViewController") as? CreateTripViewController).require()
        createTripViewController.delegate = self
        addChildViewController(createTripViewController)
        createTripViewController.view.frame = view.frame
        view.addSubview(createTripViewController.view)
        createTripViewController.didMove(toParentViewController: self)
    }

    private func configureButtuns() {
        tripButton.backgroundColor = .red
        tripButton.tag = ButtonTag.trip.rawValue
        tripsButton.backgroundColor = .green
        tripsButton.tag = ButtonTag.trips.rawValue

        tripButton.addTarget(self, action: #selector(selectViewController(_:)), for: .touchUpInside)
        tripsButton.addTarget(self, action: #selector(selectViewController(_:)), for: .touchUpInside)
    }

    private func configureViewControllers() {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let platesViewController = (mainStoryBoard.instantiateViewController(withIdentifier: "PlatesViewController") as? PlatesViewController).require()
        viewControllers.append(platesViewController)

        let loadTripViewController = (mainStoryBoard.instantiateViewController(withIdentifier: "LoadTripViewController") as? LoadTripViewController).require()
        viewControllers.append(loadTripViewController)

        if !shouldShowCreateTrip() {
            platesViewController.trip = TripService.fetchCurrentTrip()
            showViewControllerAt(index: ButtonTag.trip.rawValue)
        }
    }

    fileprivate func showViewControllerAt(index: Int) {

        if index == selectedIndex {
            return
        }

        guard let viewController = viewControllers[index] else {
            return
        }

        if childViewControllers.count == 1 {

            let vc = childViewControllers[0]
            vc.willMove(toParentViewController: self)

                viewController.view.alpha = 0.0
                viewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.stackView.frame.height)

                //        view.insertSubview(viewController.view, at: 0)
                self.view.addSubview(viewController.view)
                viewController.didMove(toParentViewController: self)

                UIView.animate(withDuration: 0.25, animations: {
                    viewController.view.alpha = 1.0
                }, completion: { _ in
                    vc.view.removeFromSuperview()
                    vc.removeFromParentViewController()
                })

        } else {

            self.addChildViewController(viewController)
            viewController.willMove(toParentViewController: self)
            viewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.stackView.frame.height)

            //        view.insertSubview(viewController.view, at: 0)
            self.view.addSubview(viewController.view)
            viewController.didMove(toParentViewController: self)

            UIView.animate(withDuration: 0.25, animations: {
                viewController.view.alpha = 1.0
            })
        }

        selectedIndex = index

    }

    @objc func selectViewController(_ sender: UIButton) {
        showViewControllerAt(index: sender.tag)

//        switch ButtonTag.init(rawValue: sender.tag).require() {
//            case ButtonTag.trip:
//            (view.viewWithTag(ButtonTag.trip.rawValue) as? UIButton)?.isEnabled = false
//            (view.viewWithTag(ButtonTag.trips.rawValue) as? UIButton)?.isEnabled = true
//        case ButtonTag.trips:
//            (view.viewWithTag(ButtonTag.trip.rawValue) as? UIButton)?.isEnabled = true
//            (view.viewWithTag(ButtonTag.trips.rawValue) as? UIButton)?.isEnabled = false
//        }
    }

}

// MARK: - CreateTripViewControllerDelegate
extension LoginViewController: CreateTripViewControllerDelegate {
    func didCreateTrip(_ createTripViewController: CreateTripViewController) {

        showViewControllerAt(index: ButtonTag.trip.rawValue)
//        UIView.animate(withDuration: 0.25, animations: {
//            createTripViewController.view.alpha = 0.0
//        }) { (_) in
//            createTripViewController.willMove(toParentViewController: nil)
//            createTripViewController.view.removeFromSuperview()
//            createTripViewController.removeFromParentViewController()
//        }
    }
}
