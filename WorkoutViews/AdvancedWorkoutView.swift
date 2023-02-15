//
//  AdvancedWorkoutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-08.
//

import SwiftUI

struct AdvancedWorkoutView: View {
   
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
                
                advancedWorkout()
                    .padding()
             //   advancedText()
                    .padding(.bottom, 40)
                
        
                HStack {
                    
                    Button(action: {
                        mapOn.toggle()
                        locationManager.startLocationUpdates()
                        timeManager.start()
                        
                    }){
                        Text("START ADVANCED WORKOUT")
                            .foregroundColor(Color .white)
                            .font(.headline)
                    }
                    
                    Button(action: {
                        mapOn.toggle()
                        locationManager.stopLocationUpdates()
                        timeManager.stop()
                        let newUser = User(fitnessLevel: "Advanced", date: Date(), elapsedTime: timeManager.elapsedTime)
                        db.addData(user: newUser)
                        
                        
                    }){
                        Text("STOP ADVANCED WORKOUT")
                            .foregroundColor(Color .red)
                            .font(.headline)
                    }
                    
                }
                .padding(.bottom, 30)
                
                
            }
        }
    }
}

struct advancedWorkout: View {
    var body: some View {
        Text("8 Rounds of: 1 Km Run, 40 Walking Lunges")
            .padding(.horizontal)
            .foregroundColor(Color("DetailGreen"))
            .fontWeight(.bold)
            .font(.title)
    }
}

struct advancedText: View {
    var body: some View {
        Text("Finish in under 60 minutes to have a chance at placing top 3!")
            .foregroundColor(.white)
            .padding(.horizontal)
            .fontWeight(.bold)
            .font(.headline)
    }
}
struct AdvancedWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedWorkoutView()
    }
}
