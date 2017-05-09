//
//  Player.swift
//  iSpy
//
//  Created by Joshua Dubey on 24/01/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import Foundation
import RealmSwift

class Player: Object {
    dynamic var name = ""
    let trips = List<Trip>()
}
