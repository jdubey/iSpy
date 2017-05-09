//
//  DataManager.swift
//  iSpy
//
//  Created by Joshua Dubey on 30/03/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift
import Require

struct DataManager {

    private static var _defaultRealm = try? Realm()

    static func defaultRealm() -> Realm {
        return DataManager._defaultRealm.require(hint: "Realm load error")
    }
}
