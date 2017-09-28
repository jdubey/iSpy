//
//  HomeScreenViewController.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 27/09/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import Rswift

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var wheelView: UIView!
    var selectedViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        let wheel = RotaryWheel(frame: wheelView.bounds, delegate: self, sectionsNumber: 3)
        wheelView.addSubview(wheel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButtonTapped(_ sender: UIButton) {
        if selectedViewController != nil {
            present(selectedViewController!, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeScreenViewController: RotaryProtocol {
    func wheelDidChangeValue(_ newValue: Int) {
        switch newValue {
        case 0:
            selectedViewController = R.storyboard.main.createTripViewController()
        case 1:
            selectedViewController = R.storyboard.main.platesViewController()
        case 2:
            selectedViewController = R.storyboard.main.loadTripViewController()
        default:
            print("nothig")
        }
    }
}
