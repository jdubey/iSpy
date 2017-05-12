//
//  BaseObject.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class BaseObject: Object {

    static func createInRealm<T: Object>(realm: Realm, value: Any = [:], update: Bool = false) -> T? {
        var newObject: T?
        do {
            try realm.write {
                newObject = realm.create(self, value: value, update: update) as? T
            }
        } catch {
            print("Failed to create object of type \(self)")
        }

        return newObject
    }
}
