//
//  InsideWorkOutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-30.
//

import SwiftUI

struct WorkOutView: View {
    
    
    @State private var ShowAlert = false
    @State var displayMap = false
    @Binding var bodyExercise : String
    @Binding var runExercise : String
    @Binding var fitnessLevelString : String
    
    var locationManager = LocationManager()
    var firebaseDB = DatabaseHandler()
    
    @ObservedObject var timeManager = TimerHandler()
    
    var body: some View {
        
        if displayMap {
            MapView()
        }
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                if locationManager.finished == true {
                    Button("STOP RUNNING!") {
                        ShowAlert = true
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .alert("Do \(bodyExercise)!", isPresented: $ShowAlert) {
                        Button(action:{
                            locationManager.finished.toggle()
                            
                        }){
                            Text("Ready for the next lap!")
                        }
                    }
                    
                }
                
                Text(String(format: "%02d:%02d:%02d", Int(timeManager.elapsedTime / 3600), Int(timeManager.elapsedTime.truncatingRemainder(dividingBy: 3600) / 60), Int(timeManager.elapsedTime.truncatingRemainder(dividingBy: 60))))
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color .white)
                
                Text("Meters: \(String(format: "%.2f", locationManager.distance))")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
                noviceWorkout(workOutText: $runExercise)
                    .padding()
                    .padding(.bottom, 40)
                
                HStack {
                    
                    Button(action: {
                        displayMap.toggle()
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
                        displayMap.toggle()
                        locationManager.stopLocationUpdates()
                        timeManager.stop()
                        let newUser = User(fitnessLevel: "\(fitnessLevelString)", date: Date(), elapsedTime: timeManager.elapsedTime)
                        firebaseDB.addData(user: newUser)
                        
                        
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

struct noviceWorkout: View {
    
    @Binding var workOutText : String
    
    var body: some View {
        Text("\(workOutText)")
        //  .padding(.horizontal)
            .foregroundColor(.green)
            .fontWeight(.bold)
            .font(.largeTitle)
            .scaledToFit()
            .minimumScaleFactor(0.01)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("DetailGreen"), lineWidth: 2)
                
            )
    }
}



