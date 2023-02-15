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
                
                noviceWorkout()
                noviceText()
                
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
                    Text("START NOVICE WORKOUT")
                        .foregroundColor(Color .white)
                        .font(.headline)
                }
                
                Button(action: {
                    self.start.toggle()
                    mapOn.toggle()
                    locationManager.stopLocationUpdates()
                    timeManager.stop()
                    let newUser = User(fitnessLevel: "Novice", date: Date())
                    db.addData(user: newUser)
                    
                    
                }){
                    Text("STOP NOVICE WORKOUT")
                        .foregroundColor(Color .red)
                        .font(.headline)
                }
                
            }
            
        }

    }
}

struct InsideWorkOutView_Previews: PreviewProvider {
    static var previews: some View {
        NoviceWorkoutView()
    }
}

struct noviceWorkout: View {
    var body: some View {
        Text("4 Rounds of: 1 Km Run, 20 Walking Lunges")
            .padding(.top, -200)
            .foregroundColor(.green)
            .fontWeight(.bold)
            .font(.largeTitle)
    }
}

struct noviceText: View {
    var body: some View {
        Text("Finish in 25 minutes or under to move to Intermediate.")
            .padding(.top, -100)
            .foregroundColor(.red)
            .padding(.horizontal)
            .fontWeight(.bold)
    }
}
