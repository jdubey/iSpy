//
//  HomeScreenViewController.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 27/09/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var wheelView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let wheel = RotaryWheel(frame: wheelView.bounds, delegate: self, sectionsNumber: 3)
        wheelView.addSubview(wheel)
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

}

extension HomeScreenViewController: RotaryProtocol {
    func wheelDidChangeValue(_ newValue: Int) {
        switch newValue {
        case 0:
            print("create trip")
        case 1:
            print("continue")
        case 2:
            print("manage")
        default:
            print("nothig")
        }
    }
}
