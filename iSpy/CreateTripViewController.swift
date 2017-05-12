//
//  CreateTripViewController.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 09/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import CleanroomLogger

class CreateTripViewController: UIViewController {

    @IBOutlet weak var nameTripLabel: UILabel!
    @IBOutlet weak var nameTripTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!

    var tripName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTripTextField.delegate = self

        goButton.setTitle("Stop", for: UIControlState.disabled)
        goButton.setTitle("GO!", for: .normal)
        goButton.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButtonTapped(_ sender: UIButton) {

        if let newTrip = TripService.defaultService.createTrip() {

            DataManager.defaultRealm().beginWrite()
            newTrip.name = tripName.require()
            _ = DataManager.safeWrite()

            Log.debug?.message("Trip = \(newTrip)")

            if let vc = self.presentingViewController as? UINavigationController {

                if let platesViewController = R.storyboard.main.platesViewController() {
                    platesViewController.trip = newTrip
                    vc.pushViewController(platesViewController, animated: true)
                }

                dismiss(animated: true)
            }

            //TOD: alert with action about creation fail, that dismisses vc
        }
    }
}

extension CreateTripViewController : UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.characters.count)! > 0 {
            tripName = textField.text
            goButton.isUserInteractionEnabled = true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
