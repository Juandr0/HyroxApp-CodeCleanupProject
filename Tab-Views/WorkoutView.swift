//
//  ListView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-11.
//

import SwiftUI
import Firebase
import FirebaseAuth

// Fixa så att vald workout är kopplad till ett visst schema

struct WorkoutView: View {
    
    @State var choiceMade = "Workouts"
    @State var isShowingWorkoutSheet = false
    
    var body: some View {
        
        VStack {
            
            Menu {
                Button(action: {
                    choiceMade = "Novice Workout"
                }, label: {
                    Text("Novice")
                })
                Button(action: {
                    choiceMade = "Intermediate Workout"
                }, label: {
                    Text("Intermediate")
                })
                Button(action: {
                    choiceMade = "Advanced Workout"
                }, label: {
                    Text("Advanced")
                })
                
            } label: {
                Label(
                    title: {Text("\(choiceMade)")},
                    icon: {Image(systemName: "plus")}
                    )
            }
            .padding(.top, -150)
            
            
            Button(action: {
                isShowingWorkoutSheet.toggle()
            }){
                Text("GO TO WORKOUT")
                    .foregroundColor(Color .black)
                    .font(.headline)
            }
            .sheet(isPresented: $isShowingWorkoutSheet) {
                InsideWorkOutView()
            }
            
        }
        
    }
    
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}


