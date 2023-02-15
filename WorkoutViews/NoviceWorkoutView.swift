//
//  InsideWorkOutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-30.
//

import SwiftUI

struct NoviceWorkoutView: View {
    
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
                
                Text("Kilometers: \(locationManager.getDistance())")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
                
                noviceWorkout()
                    .padding()
               // noviceText()
                    .padding(.bottom, 40)
                
                HStack {
                    
                    Button(action: {
                        mapOn.toggle()
                        locationManager.startLocationUpdates()
                        timeManager.start()
                        
                    }){
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green)
                    }
                    .padding()
                    
                    Button(action: {
                        mapOn.toggle()
                        locationManager.stopLocationUpdates()
                        timeManager.stop()
                        let newUser = User(fitnessLevel: "Novice", date: Date(), elapsedTime: timeManager.elapsedTime)
                        db.addData(user: newUser)
                        
                        
                    }){
                        Image(systemName: "stop.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                    }
                    .padding()
                    
                }
                .padding(.bottom, 30)

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
            .padding(.horizontal)
            .foregroundColor(Color("DetailGray"))
            .fontWeight(.bold)
            .font(.title)
    }
}

struct noviceText: View {
    var body: some View {
        Text("Finish in 25 minutes or under to move to Intermediate.")
            .padding(.top, -100)
            .foregroundColor(Color("DetailGray"))
            .padding(.horizontal)
            .fontWeight(.bold)
    }
}
