//
//  MapViewModel.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-29.
//

import Foundation
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    var location : CLLocationCoordinate2D?
    var startLocation : CLLocationCoordinate2D?
    
    
        override init() {
        super.init()
        manager.delegate = self
    }
    
    func startLocationUpdates() {
        startLocation = location
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func getDistance() -> CLLocationDistance{
        if startLocation != nil {
            return (location?.distance(to: startLocation!))!
        }
        return 0.0
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
       // print("Current location updated \(location)")
        var distance = getDistance()
    
        print("Current Distance: \(distance)")
    }
    

}

import MapKit

extension CLLocationCoordinate2D{
    func distance(to: CLLocationCoordinate2D) -> CLLocationDistance{
        MKMapPoint(self).distance(to: MKMapPoint(to))
    }
}
