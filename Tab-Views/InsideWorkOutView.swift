//
//  InsideWorkOutView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-30.
//

import SwiftUI

//Add save button that saves distance, time and date to Firebase

struct InsideWorkOutView: View {
    
    @State var mapOn = false
    @State var start = false
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        if mapOn {
            MapView()
        }
        
        ZStack {
            Color.gray
            .ignoresSafeArea()
            
            VStack {
                
                Text("\(count)")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color .white)
                
                Button(action: {
                    self.start.toggle()
                    mapOn.toggle()
                    
                }){
                    Text("START WORKOUT")
                        .foregroundColor(Color .black)
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

struct InsideWorkOutView_Previews: PreviewProvider {
    static var previews: some View {
        InsideWorkOutView()
    }
}
