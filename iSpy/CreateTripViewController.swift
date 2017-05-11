//
//  CreateTripViewController.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 09/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

class CreateTripViewController: UIViewController {

    @IBOutlet weak var nameTripLabel: UILabel!
    @IBOutlet weak var nameTripTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.  test commit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButtonTapped(_ sender: UIButton) {

        let newTrip = TripService.defaultService.createTrip()

        if let vc = self.presentingViewController as? UINavigationController {

            if let platesViewController = R.storyboard.main.platesViewController() {
                platesViewController.trip = newTrip
                vc.pushViewController(platesViewController, animated: true)
            }
        }
            dismiss(animated: true)
    }
}
