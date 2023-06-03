//
//  MapViewModel.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-29.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    var lastLocation: CLLocation?
    @Published var distance: CLLocationDistance = 0
    @Published var finished: Bool = false
    
    override init() {
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
    }
    
    func startLocationUpdates() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func stopLocationUpdates() {
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {
            return
        }
        
        if lastLocation == nil {
            lastLocation = currentLocation
        }
        
        let delta = currentLocation.distance(from: lastLocation!)
        print("delta: \(delta)")
        if delta < 100 {
            distance += delta
        }
        lastLocation = currentLocation
        
        print("Distance: \(distance) m")
        if distance >= 1000 {
            print("1km")
            finished = true
            distance = 0
            
        }
        
        let distanceInKm = distance / 1000.0
        
    }
}





