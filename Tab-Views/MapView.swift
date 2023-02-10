//
//  MapView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-29.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var viewModel = LocationManager()
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3323341, longitude: -122.0312186), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    var body: some View {
        Map(coordinateRegion: $region,
                        interactionModes: [.all],
                        showsUserLocation: true,
                        userTrackingMode: .constant(.follow)
            
        )}
        
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


