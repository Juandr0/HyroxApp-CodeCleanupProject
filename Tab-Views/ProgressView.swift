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
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Progress")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                
                    List(model.list) { item in
                        HStack {
                            Text(item.date)
                            Text(item.time)
                            Text(item.distance)
                            Text(item.fitnessLevel)
                        }
                        .foregroundColor(.black)
                        .bold()
                    }
                
                
                TextField("Date", text: $date)
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                    )
                
                    .padding()
                TextField("Distance", text: $distance)
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                    )
                
                    .padding()
                TextField("Time", text: $time)
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                    )
                
                    .padding()
                TextField("Fitness Level", text: $fitnessLevel)
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                    )
                
                    .padding()
                
                Button {
                    model.addData(date: date, distance: distance, time: time, fitnessLevel: fitnessLevel)
                    
                    //Clear the textfields
                    
                    date = ""
                    distance = ""
                    time = ""
                    fitnessLevel = ""
                    
                } label: {
                    Text("Add WorkOut")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                        )
                        .padding(.horizontal)
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
