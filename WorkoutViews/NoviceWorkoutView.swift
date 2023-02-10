//
//  InsideWorkOutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-30.
//

import SwiftUI

//Add save button that saves distance, time and date to Firebase

struct NoviceWorkoutView: View {
    
    @State var mapOn = false
    @State var start = false
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var locationManager = LocationManager()
    
    
    var body: some View {
        
        if mapOn {
            MapView()
        }
        
        ZStack {
            Color.black
            .ignoresSafeArea()
            
            VStack {
                
                Text("4 Rounds of: 1 Km Run, 1:30 min Burpees")
                    .padding(.top, -200)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Finish in 25 minutes or under to move to Intermediate.")
                    .padding(.top, -100)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Text("\(count)")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color .white)
                
                Button(action: {
                    self.start.toggle()
                    mapOn.toggle()
                    locationManager.startLocationUpdates()
                    
                }){
                    Text("START NOVICE WORKOUT")
                        .foregroundColor(Color .white)
                        .font(.headline)
                }
                
            }
            
        }
        .onReceive(time) { (_) in
            
            if self.start {
                self.count += 1
            }
            
        }

    }
}

struct InsideWorkOutView_Previews: PreviewProvider {
    static var previews: some View {
        NoviceWorkoutView()
    }
}
