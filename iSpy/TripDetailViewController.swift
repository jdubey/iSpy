//
//  TripDetailViewController.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 22/09/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tripManagementMapView: TripManagementMapView!

    var licensePlates = [LicensePlate]()
    var highlistPlate: LicensePlate?

    override func viewDidLoad() {
        super.viewDidLoad()

        tripManagementMapView.licensePlates = licensePlates
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTapClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
