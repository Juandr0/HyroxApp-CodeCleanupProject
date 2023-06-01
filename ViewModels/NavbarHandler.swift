//
//  TabView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-26.
//

import SwiftUI

struct NavbarHandler: View {
    var body: some View {            
            TabView {
                    
                    WorkOutManagerView()
                        .tabItem {
                            Label("WorkOut", systemImage: "trophy")
                        }
            
                    ProgressView()
                        .tabItem {
                            Label("Progress", systemImage: "flowchart")
                        }
                
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gearshape")
                        }
                
                }
            .accentColor(Color("AccentColor"))
            
    }
}

struct TabControllerView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarHandler()
    }
}
