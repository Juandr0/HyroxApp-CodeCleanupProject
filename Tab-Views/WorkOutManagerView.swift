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
    
    @State var choiceMade = ""
    @State var isShowingNoviceWorkoutSheet = false
    @State var workOut : String = ""
    @State var workOutText : String = ""
    @State var fitnessLevelString : String = ""
    
    var body: some View {
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            Spacer()
                Menu {
                    Button(action: {
                        choiceMade = "Novice"
                    }, label: {
                        Text("Novice")
                    })
                    Button(action: {
                        choiceMade = "Intermediate"
                    }, label: {
                        Text("Intermediate")
                    })
                    Button(action: {
                        choiceMade = "Advanced"
                    }, label: {
                        Text("Advanced")
                    })
                    
                } label: {
                    Label(
                        title: {Text("Fitness-level: \(choiceMade)")},
                        icon: {Image(systemName: "text.badge.plus")}
                    )
                }
                .padding(.horizontal)
                .padding(.top, -100)
                .foregroundColor(.green)
                .font(.title3)
                .bold()
                Button(action: {
                    
                    if choiceMade == "Novice" {
                        workOut = "10 PUSHUPS"
                        workOutText = "4 ROUNDS: 1 KM RUN - 10 PUSHUPS"
                        fitnessLevelString = "Novice"
                        isShowingNoviceWorkoutSheet.toggle()
                        
                    }
                    
                    if choiceMade == "Intermediate" {
                        workOut = "25 SQUATS"
                        workOutText = "8 ROUNDS: 1KM RUN - 25 SQUATS"
                        fitnessLevelString = "Intermediate"
                        isShowingNoviceWorkoutSheet.toggle()
                
                    }
                    
                    if choiceMade == "Advanced" {
                        workOut = "20 LUNGES, 15 PUSHUPS"
                        workOutText = "10 ROUNDS: 1KM RUN - 20 LUNGES, 15 PUSHUPS"
                        fitnessLevelString = "Advanced"
                        isShowingNoviceWorkoutSheet.toggle()
                        
                    }
                    
                }){
                    GoToWorkoutTextView()
                        .padding(.bottom, 100)
                }
                .sheet(isPresented: $isShowingNoviceWorkoutSheet) {
                    
                    WorkOutView(workOut: $workOut, workOutText: $workOutText, fitnessLevelString: $fitnessLevelString)
                    
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
                    .fill(.black)
            )
            .padding(.horizontal)
            .padding(.top, 300)
    }
}
