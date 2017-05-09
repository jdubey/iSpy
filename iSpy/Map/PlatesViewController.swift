//
//  PlatesViewController.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class PlatesViewController: UIViewController {

    @IBOutlet weak var platesTableView: UITableView!

    var trip: Trip?

    private let realm = DataManager.defaultRealm()

    var plates: Results<LicensePlate>?

    override func viewDidLoad() {
        super.viewDidLoad()

        plates = realm.objects(LicensePlate.self)

        platesTableView.delegate = self
        platesTableView.dataSource = self

    }
}

// MARK: - UITableViewDataSource
extension PlatesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let plates = plates else {
            return 0
        }

        return plates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.platesTableViewCell.identifier) as? PlatesTableViewCell {

            if let name = plates?[indexPath.row].name {
                cell.nameLabel.text = name
                cell.plateImageView.image = UIImage(named:name)
            }
            return cell
        }

        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension PlatesViewController: UITableViewDelegate {

}
