//
//  UserLoginView.swift
//  HyroxFitnessApp
//
//  Created by Alexander on 2023-06-03.
//

import SwiftUI

struct UserLoginView: View {
    
    @EnvironmentObject var signInRegister: AuthenticationHandler
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        ZStack {
            Color("AccentColor")
                .ignoresSafeArea()
            
        VStack {
            HStack {
                TitleView()
                Spacer()
            }
            .padding()
            .padding(.top, 50)
            
            Spacer()
            
            CredentialsView(email: $email, password: $password)
            
            Spacer()
            Spacer()
            
            HStack {
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    signInRegister.signIn(email: email, password: password)
                }) {
                    SignInView()
              
                }
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    signInRegister.register(email: email, password: password)
                }) {
                    RegisterView()
                }
                
            }
        }
    }
}
}
