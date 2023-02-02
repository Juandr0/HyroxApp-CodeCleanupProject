//
//  ContentView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-09.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct ContentView: View {
    
    @EnvironmentObject var signInRegister: SignInRegister
    
    var body: some View {
        
        if signInRegister.isSignedIn {
            TabControllerView()
        } else {
            SignInRegisterView()
        }
    }
    
    struct SignInRegisterView: View {
        
        @EnvironmentObject var signInRegister: SignInRegister
        
        @State var email = ""
        @State var password = ""
        
        var body: some View {
            
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
            VStack {
                HStack {
                    Text("Prepare for Hyrox!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.green)
                    
                    Spacer()
                }
                .padding()
                .padding(.top, 50)
                
                Spacer()
                
                TextField("Email Address", text: $email)
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                    )
                
                    .padding()
                
                TextField("Password", text: $password)
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                    )
                
                    .padding()
                Spacer()
                Spacer()
                
                
                
                HStack {
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        signInRegister.signIn(email: email, password: password)
                    }) {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                        
                            .frame(maxWidth: .infinity)
                            .padding()
                        
                            .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green)
                            )
                            .padding(.horizontal)
                  
                    }
                    
                    
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        signInRegister.register(email: email, password: password)
                    }) {
                        Text("Register")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                        
                            .frame(maxWidth: .infinity)
                            .padding()
                        
                            .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                            )
                            .padding(.horizontal)
                    }
                    
                    
                } // HStack End
                
                
            } // VStack End
        }
    }
}
    
    
    
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInRegisterView()
        }
    }
    
    
}
