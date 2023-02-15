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
    var location: CLLocationCoordinate2D?
    var startLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func startLocationUpdates() {
      //  if let location = location {
       //     startLocation = location
       // }
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func stopLocationUpdates() {
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        
        if startLocation == nil {
                startLocation = location
            }
            
            let distance = getDistance()
            print("Current Distance: \(distance) kilometers")
        
        }
        
        func getDistance() -> Double {
            if let startLocation = startLocation, let location = location {
                let distance = MKMapPoint(startLocation).distance(to: MKMapPoint(location)) / 1000
                return distance
            }
            return 0.0
        }}
