//
//  IntermediateWorkoutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-08.
//

import SwiftUI

struct IntermediateWorkoutView: View {

    @State var mapOn = false

    var locationManager = LocationManager()
    var db = ViewModel()
    
    @ObservedObject var timeManager = TimerManager()
    
    
    var body: some View {
        
        if mapOn {
            MapView()
        }
        
        ZStack {
            Color.black
            .ignoresSafeArea()
            
            VStack {
                
                Text(String(format: "%02d:%02d:%02d", Int(timeManager.elapsedTime / 3600), Int(timeManager.elapsedTime.truncatingRemainder(dividingBy: 3600) / 60), Int(timeManager.elapsedTime.truncatingRemainder(dividingBy: 60))))
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color .white)
                
                Text("Distance: \(locationManager.getDistance())")
                    .foregroundColor(.white)
                
                Spacer()
                intermediateWorkout()
                    .padding()
              //  intermediateText()
                    .padding(.bottom, 40)
                
                HStack {
                    
                    Button(action: {
                        mapOn.toggle()
                        locationManager.startLocationUpdates()
                        timeManager.start()
                        
                    }){
                        Text("START INTERMEDIATE WORKOUT")
                            .foregroundColor(Color .white)
                            .font(.headline)
                    }
                    
                    Button(action: {
                        mapOn.toggle()
                        locationManager.stopLocationUpdates()
                        timeManager.stop()
                        let newUser = User(fitnessLevel: "Intermediate", date: Date(), elapsedTime: timeManager.elapsedTime)
                        db.addData(user: newUser)
                        
                        
                    }){
                        Text("STOP INTERMEDIATE WORKOUT")
                            .foregroundColor(Color .red)
                            .font(.headline)
                    }
                    
                }
                .padding(.bottom, 30)
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
            .padding(.horizontal)
            .foregroundColor(Color("DetailGreen"))
            .fontWeight(.bold)
            .font(.title)
    }
}

struct intermediateText: View {
    var body: some View {
        Text("Finish in 25 minutes or under to move to Advanced.")
            .padding(.top, -100)
            .foregroundColor(Color("DetailGray"))
            .padding(.horizontal)
            .fontWeight(.bold)
    }
}
