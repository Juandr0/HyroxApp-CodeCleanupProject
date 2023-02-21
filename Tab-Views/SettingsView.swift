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
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Button(action: {
                    signInRegister.signOut()
                    
                }) {
                    Text("Sign Out")
                }
                .foregroundColor(.white)
                .font(.title3)
                .bold()
            
                .frame(maxWidth: .infinity)
                .padding()
            
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                )
                .frame(width: 200, height: 30)
                .padding(.horizontal)
                .padding(.bottom, 50)
            }
            
        }
  }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
