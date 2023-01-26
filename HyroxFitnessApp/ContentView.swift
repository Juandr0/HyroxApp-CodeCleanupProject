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
                SignInView()
            }
    }
        
    
    struct SignInView: View {
        
        @EnvironmentObject var signInRegister: SignInRegister
        
        @State var email = ""
        @State var password = ""
    
        var body: some View {
            
            VStack {
                Text("Prepare for...")
                    .padding(.top, 100)
                    .font(.body)
                Text("HYROX")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "trophy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(.yellow))

                Spacer()
                
                VStack {
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("Password", text: $password)
                        .padding()
                        .padding(.bottom, 200)
                        .background(Color(.secondarySystemBackground))
                        
                }
                
                HStack {
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        signInRegister.signIn(email: email, password: password)
                    }) {
                        Text("Sign In")
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.black)
                            .foregroundColor(Color(.white))
                            
                    }
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        signInRegister.register(email: email, password: password)
                    }) {
                        Text("Register")
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.black)
                            .foregroundColor(Color(.white))
                    }

                }

                
            }
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
}
