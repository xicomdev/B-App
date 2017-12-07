//
//  LocationManager.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/26/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import CoreLocation
class LocationManager: NSObject, CLLocationManagerDelegate {

    static var sharedObj = LocationManager()

    var locationManager = CLLocationManager()
    func startLocationUpdates() {
        locationManager.delegate = self
        locationManager.desiredAccuracy  = kCLLocationAccuracyBest
        locationManager.activityType = .automotiveNavigation
        locationManager.distanceFilter = 10
        locationManager.pausesLocationUpdatesAutomatically = true
        
        if Bundle.main.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") != nil {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        UserDefaults.standard.set("\(location.coordinate.latitude)", forKey: "lat")
        UserDefaults.standard.set("\(location.coordinate.longitude)", forKey: "long")
        UserDefaults.standard.synchronize()
    }
    
    func stopLocationUpdates() {
        locationManager.stopUpdatingLocation()
    }
    
    //MARK:- WHEN DENIED
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.denied {
            UserDefaults.standard.set("\(0.0)", forKey: "lat")
            UserDefaults.standard.set("\(0.0)", forKey: "long")
            UserDefaults.standard.synchronize()
        }
    }
    
}
