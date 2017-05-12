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
import CleanroomLogger

struct DataManager {

    private static var _defaultRealm = try? Realm()

    static func defaultRealm() -> Realm {
        return DataManager._defaultRealm.require(hint: "Realm load error")
    }

    static func safeWrite() -> Bool {

        do {
            try _defaultRealm?.commitWrite()
        } catch {
            Log.error?.message("failed to write data. Error: \(error)")
            return false
        }
        return true
    }
}
