//
//  HyroxFitnessAppApp.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-09.
//

import SwiftUI
import Firebase

@main
struct HyroxFitnessAppApp: App {
   // @StateObject var dataManager = DataManager()

    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let signInRegister = SignInRegister()
            ContentView()
                //.environmentObject(dataManager)
                .environmentObject(signInRegister)
        }
    }
}
