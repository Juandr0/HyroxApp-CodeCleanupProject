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
    
   // @State var choiceMade = ""
    @EnvironmentObject var signInRegister: SignInRegister
    
    var body: some View {
        
        ZStack {
            Color .black
                .ignoresSafeArea()
            
            VStack{
               // Menu {
               //     Button(action: {
               //         choiceMade = "Novice"
               //     }, label: {
               //         Text("Novice")
               //     })
               //     Button(action: {
               //         choiceMade = "Intermediate"
               //     }, label: {
               //         Text("Intermediate")
               //     })
               //     Button(action: {
               //         choiceMade = "Advanced"
               //     }, label: {
               //         Text("Advanced")
               //     })
                    
               // } label: {
               //     Label(
               //         title: {Text("Fitness-level: \(choiceMade)")},
               //         icon: {Image(systemName: "text.badge.plus")}
               //     )
               // }
               // .padding(.top, 200)
               // .foregroundColor(Color .green)
                
                Button(action: {
                    signInRegister.signOut()
                    
                }) {
                    Text("Sign Out")
                }
                .foregroundColor(Color .red)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 500)
            }
            
        }
  }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
