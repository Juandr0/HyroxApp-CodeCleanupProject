//
//  CustomNavBarView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-14.
//

import SwiftUI

enum Tabs: Int {
    case workout = 0
    case previous = 1
    case settings = 2
}

struct CustomNavBarView: View {
    @Binding var selectedTabs: Tabs
    
    var body: some View {
        
        HStack (alignment: .center) {
            
            Button(action: {
                // Switch to "WorkOut"
                selectedTabs = .workout
            }) {
                GeometryReader{ geo in
                    
                    if selectedTabs == .workout {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                    }
                    
                    
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "figure.highintensity.intervaltraining")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("WorkOut")
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                }
                
            }
            
            Button(action: {
                // Switch to "Previous"
                selectedTabs = .previous
            }) {
                
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "scribble")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Previous")
                    
                }
                
                
                
            }
            
            Button(action: {
                // Switch to "Settings"
                selectedTabs = .settings
            }) {
                GeometryReader{ geo in
                    
                    if selectedTabs == .settings {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                    }
                    
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("Settings")
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                
            }
            
            
            
        }
        .frame(height: 82)
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView(selectedTabs: .constant(.workout))
    }
}
