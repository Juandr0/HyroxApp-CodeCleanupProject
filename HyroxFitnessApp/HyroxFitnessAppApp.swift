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
    
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let signInRegister = AuthenticationHandler()
            HomeScreenView()
                .environmentObject(signInRegister)
        }
    }
}
