//
//  ListView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-11.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct WorkOutManagerView: View {
    
    @State var workoutLevel = ""
    @State var displayNoviceWorkoutSheet = false
    @State var bodyExercise : String = ""
    @State var runExercise : String = ""
    @State var fitnessLevelString : String = ""
    
    var body: some View {
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Menu {
                    Button(action: {
                        workoutLevel = "Novice"
                    }, label: {
                        Text("Novice")
                    })
                    Button(action: {
                        workoutLevel = "Intermediate"
                    }, label: {
                        Text("Intermediate")
                    })
                    Button(action: {
                        workoutLevel = "Advanced"
                    }, label: {
                        Text("Advanced")
                    })
                    
                } label: {
                    Label(
                        title: {Text("Fitness-level: \(workoutLevel)")},
                        icon: {Image(systemName: "text.badge.plus")}
                    )
                }
                .padding(.horizontal)
                .padding(.top, -100)
                .foregroundColor(.green)
                .font(.title3)
                .bold()
                Button(action: {
                    
                    if workoutLevel == "Novice" {
                        bodyExercise = "10 PUSHUPS"
                        runExercise = "4 ROUNDS: 1 KM RUN - 10 PUSHUPS"
                        fitnessLevelString = "Novice"
                        displayNoviceWorkoutSheet.toggle()
                        
                    }
                    
                    if workoutLevel == "Intermediate" {
                        bodyExercise = "25 SQUATS"
                        runExercise = "8 ROUNDS: 1KM RUN - 25 SQUATS"
                        fitnessLevelString = "Intermediate"
                        displayNoviceWorkoutSheet.toggle()
                        
                    }
                    
                    if workoutLevel == "Advanced" {
                        bodyExercise = "20 LUNGES, 15 PUSHUPS"
                        runExercise = "10 ROUNDS: 1KM RUN - 20 LUNGES, 15 PUSHUPS"
                        fitnessLevelString = "Advanced"
                        displayNoviceWorkoutSheet.toggle()
                        
                    }
                    
                }){
                    GoToWorkoutTextView()
                        .padding(.bottom, 100)
                }
                .sheet(isPresented: $displayNoviceWorkoutSheet) {
                    
                    WorkOutView(bodyExercise: $bodyExercise, runExercise: $runExercise, fitnessLevelString: $fitnessLevelString)
                    
                }
                
            }
            
        }
        
    }
    
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutManagerView()
    }
}



struct GoToWorkoutTextView: View {
    var body: some View {
        Text("GO TO WORKOUT")
            .foregroundColor(.white)
            .font(.title3)
            .bold()
        
            .frame(maxWidth: .infinity)
            .padding()
        
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("AccentColor"))
            )
            .padding(.horizontal)
            .padding(.top, 300)
    }
}
