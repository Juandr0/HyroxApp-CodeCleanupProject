//
//  TabView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-26.
//

import SwiftUI

struct TabControllerView: View {
    var body: some View {
        
        TabView {
            
                WorkoutView()
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
        .accentColor(Color .black)
        

    }
}

struct TabControllerView_Previews: PreviewProvider {
    static var previews: some View {
        TabControllerView()
    }
}
