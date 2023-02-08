//
//  IntermediateWorkoutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-08.
//

import SwiftUI

struct IntermediateWorkoutView: View {

    @State var mapOn = false
    @State var start = false
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        if mapOn {
            MapView()
        }
        
        ZStack {
            Color.black
            .ignoresSafeArea()
            
            VStack {
                
                Text("6 Rounds of: 1 Km Run, 2 min Burpees")
                    .padding(.top, -200)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Finish in 25 minutes or under to move to Advanced.")
                    .padding(.top, -100)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Text("\(count)")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color .white)
                
                Button(action: {
                    self.start.toggle()
                    mapOn.toggle()
                    
                }){
                    Text("START INTERMEDIATE WORKOUT")
                        .foregroundColor(Color .white)
                        .font(.headline)
                }
                
            }
            
        }
        .onReceive(time) { (_) in
            
            if self.start {
                self.count += 1
            }
            
        }

    }
}

struct IntermediateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        IntermediateWorkoutView()
    }
}
