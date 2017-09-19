//
//  LocationManager.swift
//  iSpy
//
//  Created by Dubey, Josh (UK - London) on 12/05/2017.
//  Copyright © 2017 Josh Dubey. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

class LocationManager: NSObject {

    private static var _defaultManager = LocationManager()
    fileprivate var _currentLocation: CLLocation?

    fileprivate var clLocationManager = CLLocationManager()

    static func defaultManager() -> LocationManager {
        return LocationManager._defaultManager
    }

    override init() {
        super.init()
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func authorize() {
        let authStatus = CLLocationManager.authorizationStatus()

        switch authStatus {
        case .notDetermined:
            clLocationManager.requestWhenInUseAuthorization()
            break
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            startLocationServices()
            break
        }

        return
    }

    func startLocationServices() {
        CLLocationManager.locationServicesEnabled()
        clLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        clLocationManager.startUpdatingLocation()

    }

    func currentLocation() -> Location? {
        let newLocation: Location? = Location.createInRealm(realm: DataManager.defaultRealm(), value:["latitude": _currentLocation?.coordinate.latitude ?? 0.0,
                                                                                           "longitude": _currentLocation?.coordinate.longitude ?? 0.0,
                                                                                           "timestamp": _currentLocation?.timestamp ?? Date()])
        return newLocation
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            startLocationServices()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        _currentLocation = locations.last
    }
}
