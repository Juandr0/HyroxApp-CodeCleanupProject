//
//  AdvancedWorkoutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-08.
//

import SwiftUI

struct AdvancedWorkoutView: View {
   
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
                
                Text("8 Rounds of: 1 Km Run + 50 Squats")
                    .padding(.horizontal)
                    .padding(.top, -200)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Finish in under an hour and you have a great chance of placing top 3!")
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
                    Text("START ADVANCED WORKOUT")
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

struct AdvancedWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedWorkoutView()
    }
}
