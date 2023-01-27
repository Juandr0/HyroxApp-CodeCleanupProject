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
    
    
    @State var count = 0
    @State var start = false
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            
            Text("\(count)")
                .padding()
                .font(.largeTitle)
            
            Button(action: {
                self.start.toggle()
            }, label: {
                Text("RUN")
                    .foregroundColor(Color .black)
                    .font(.headline)
            })
            
        }
        .onReceive(time) { (_) in
            
            if self.start {
                self.count += 1
            }
            
        }
        
        }
        
    }
    
    struct WorkoutView_Previews: PreviewProvider {
        static var previews: some View {
            WorkoutView()
        }
    }
    
    
