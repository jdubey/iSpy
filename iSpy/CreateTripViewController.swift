//
//  CreateTripViewController.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 09/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

protocol CreateTripViewControllerDelegate: class {
    func didCreateTrip(_ createTripViewController: CreateTripViewController)
}

class CreateTripViewController: UIViewController {

    @IBOutlet weak var nameTripLabel: UILabel!
    @IBOutlet weak var nameTripTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!

    var tripName: String?
    weak var delegate: CreateTripViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTripTextField.delegate = self
        nameTripTextField.becomeFirstResponder()

        goButton.setTitle("Stop", for: .disabled)
        goButton.setTitleColor(.red, for: .disabled)
        goButton.setTitle("GO!", for: .normal)
        goButton.isEnabled = false

        addHomeButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButtonTapped(_ sender: UIButton) {

        if let newTrip = TripService.defaultService.createTrip() {

            DataManager.defaultRealm().beginWrite()
            newTrip.name = nameTripTextField.text.require()
            _ = DataManager.safeWrite()

            delegate?.didCreateTrip(self)

            //TODO: alert with action about creation fail, that dismisses vc
        }
    }
}

extension CreateTripViewController : UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, text.characters.count > 1 || string.characters.count > 0 {
            goButton.isEnabled = true
        } else {
            goButton.isEnabled = false
        }
        return true
    }
}
