//
//  SettingsView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SettingsView: View {
    
    @EnvironmentObject var signInRegister: SignInRegister
    
    var body: some View {

        Button(action: {
            signInRegister.signOut()
            
        }) {
            Text("Sign Out")
        }
  }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
