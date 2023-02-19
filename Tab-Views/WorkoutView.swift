//
//  ListView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-11.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct WorkoutView: View {
    
    @State var choiceMade = ""
    @State var isShowingNoviceWorkoutSheet = false
    @State var isShowingIntermediateWorkoutSheet = false
    @State var isShowingAdvancedWorkoutSheet = false
    
    var body: some View {
        
        
        ZStack {
            Color(.white)
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
                .padding(.horizontal)
                .padding(.top, 60)
                .foregroundColor(.green)
                .font(.title3)
                .bold()
                Button(action: {
                    
                    if choiceMade == "Novice" {
                        
                        isShowingNoviceWorkoutSheet.toggle()
                        
                    }
                    
                    if choiceMade == "Intermediate" {
                        
                        isShowingIntermediateWorkoutSheet.toggle()
                
                    }
                    
                    if choiceMade == "Advanced" {
                        
                        isShowingAdvancedWorkoutSheet.toggle()
                        
                    }
                    
                    
                }){
                    Text("NEXT")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black)
                        )
                        .padding(.horizontal)
                        .padding(.top, 300)
                       // .frame(width: 200, height: 20)
                }
                .sheet(isPresented: $isShowingNoviceWorkoutSheet) {
                   NoviceWorkoutView()
                }
                .sheet(isPresented: $isShowingIntermediateWorkoutSheet) {
                    IntermediateWorkoutView()
                }
                .sheet(isPresented: $isShowingAdvancedWorkoutSheet) {
                    AdvancedWorkoutView()
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


