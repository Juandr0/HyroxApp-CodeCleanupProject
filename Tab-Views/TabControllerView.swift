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
                
                    WorkOutManagerView()
                        .tabItem {
                            Label("WorkOut", systemImage: "trophy")
                        }
                            .toolbarBackground(
                                Color.black,
                                for: .tabBar)
                
                    ProgressView()
                        .tabItem {
                            Label("Progress", systemImage: "flowchart")
                        }

                            .toolbarBackground(
                                Color.black,
                                for: .tabBar)
                
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gearshape")
                        }
                
                            .toolbarBackground(
                                Color.black,
                                for: .tabBar)
                
            }
            .accentColor(.white)

    }
}

struct TabControllerView_Previews: PreviewProvider {
    static var previews: some View {
        TabControllerView()
    }
}
