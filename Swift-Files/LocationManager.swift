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
    
    override init() {
        super.init()
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
        
        distance += currentLocation.distance(from: lastLocation!)
        lastLocation = currentLocation
        
        if distance >= 1000 {
            distance = 0
        }
            
        let distanceInKm = distance / 1000.0
        print("Distance: \(distanceInKm) kilometers")
    }
}





