//
//  ListView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-11.
//

import SwiftUI
import Firebase
import FirebaseAuth

// Fixa så att vald workout är kopplad till ett visst schema som syns i insidework-sheet

struct WorkoutView: View {
    
    @State var choiceMade = ""
    @State var isShowingWorkoutSheet = false
    
    var body: some View {
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
        
        VStack {
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
                .padding(.top, -75)
                .foregroundColor(.green)
                .font(.title3)
                .bold()
                Button(action: {
                    isShowingWorkoutSheet.toggle()
                }){
                    Text("GO TO WORKOUT")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black)
                        )
                        .padding(.horizontal, 50)
                }
                .sheet(isPresented: $isShowingWorkoutSheet) {
                    InsideWorkOutView()
                }
                
            }
            
        }
        
    }
    
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}


