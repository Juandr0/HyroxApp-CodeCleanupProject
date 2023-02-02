//
//  PastWorkOutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-25.
//

import SwiftUI
import Firebase

//List of workouts from firebase

// Logged on users data should be showing only for that user

struct ProgressView: View {
    
    @ObservedObject var model = ViewModel()
    
    @State var date = ""
    @State var distance = ""
    @State var time = ""
    @State var fitnessLevel = ""
    
    var body: some View {
        
        ZStack {
           // Color .black
           //     .ignoresSafeArea()
            
            VStack{
                Text("Progress")
                  //  .foregroundColor(Color .white)
                    .font(.headline)
                  //  .padding(.top, -100)
                    .fontWeight(.bold)
                
                
                    List(model.list) { item in
                        HStack {
                            Text(item.date)
                            Text(item.time)
                            Text(item.distance)
                            Text(item.fitnessLevel)
                        }
                    }
                
                
                TextField("Date", text: $date)
                    .foregroundColor(Color .black)
                TextField("Distance", text: $distance)
                    .foregroundColor(Color .black)
                TextField("Time", text: $time)
                    .foregroundColor(Color .black)
                TextField("Fitness Level", text: $fitnessLevel)
                    .foregroundColor(Color .black)
                
                Button {
                    model.addData(date: date, distance: distance, time: time, fitnessLevel: fitnessLevel)
                    
                    //Clear the textfields
                    
                    date = ""
                    distance = ""
                    time = ""
                    fitnessLevel = ""
                    
                } label: {
                    Text("Add WorkOut")
                        .foregroundColor(Color .black)
                }
                
                
            }
            .onAppear() {
                model.getData()
            }
            
            
            
        }
        
    }
    
    
    struct ProgressView_Previews: PreviewProvider {
        static var previews: some View {
            ProgressView()
        }
    }
}
