//
//  IntermediateWorkoutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-08.
//

import SwiftUI

struct IntermediateWorkoutView: View {

    @State var mapOn = false
    @State var start = false
    @State var count = 0
   // @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var locationManager = LocationManager()
    var db = ViewModel()
    
    @ObservedObject var timeManager = TimeManager()
    
    
    var body: some View {
        
        if mapOn {
            MapView()
        }
        
        ZStack {
            Color.black
            .ignoresSafeArea()
            
            VStack {
                
                intermediateWorkout()
                intermediateText()
                
                Text(String(format: "%1.f", timeManager.secondsElapsed))
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color .white)
                
                Button(action: {
                    self.start.toggle()
                    mapOn.toggle()
                    locationManager.startLocationUpdates()
                    timeManager.start()
                    
                }){
                    Text("START INTERMEDIATE WORKOUT")
                        .foregroundColor(Color .white)
                        .font(.headline)
                }
                
                Button(action: {
                    self.start.toggle()
                    mapOn.toggle()
                    locationManager.stopLocationUpdates()
                    timeManager.stop()
                    db.addData(date: Date(),/*distance: , time: timeManager.secondsElapsed,*/ fitnessLevel: "Intermediate")
                    
                    
                }){
                    Text("STOP INTERMEDIATE WORKOUT")
                        .foregroundColor(Color .red)
                        .font(.headline)
                }
            }
        }
    }
}

struct IntermediateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        IntermediateWorkoutView()
    }
}

struct intermediateWorkout: View {
    var body: some View {
        Text("8 Rounds of: 1 Km Run, 20 Walking Lunges")
            .padding(.top, -200)
            .foregroundColor(.green)
            .fontWeight(.bold)
            .font(.largeTitle)
    }
}

struct intermediateText: View {
    var body: some View {
        Text("Finish in 25 minutes or under to move to Advanced.")
            .padding(.top, -100)
            .foregroundColor(.red)
            .padding(.horizontal)
            .fontWeight(.bold)
    }
}
