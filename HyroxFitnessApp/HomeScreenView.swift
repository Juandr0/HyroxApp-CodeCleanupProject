//
//  ContentView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-09.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct HomeScreenView: View {
    
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
                
                TextField("Enter email...", text: $email, prompt: Text("Enter email...").foregroundColor(.white.opacity(0.5)))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("DetailGray"))
                    
                    )
                    .padding()
                
                SecureField("Enter password...", text: $password, prompt: Text("Enter password...").foregroundColor(.white.opacity(0.5)))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("DetailGray"))
                    
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
    
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInRegisterView()
        }
    }
    
    
}

struct TitleView: View {
    var body: some View {
        Text("Prepare for Hyrox!")
            .font(.navTitle)
            .bold()
            .foregroundColor(Color("DetailGreen"))
        
    }
}

struct SignInView: View {
    var body: some View {
        Text("Sign In")
            .foregroundColor(.white)
            .font(.title3)
            .bold()
        
            .frame(maxWidth: .infinity)
            .padding()
        
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("DetailGreen"), lineWidth: 2)
                   // .fill(Color("DetailGreen"))
                
            )
            .padding(.horizontal)
    }
}

struct RegisterView: View {
    var body: some View {
        Text("Register")
            .foregroundColor(.white)
            .font(.title3)
            .bold()
        
            .frame(maxWidth: .infinity)
            .padding()
        
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red)
            )
            .padding(.horizontal)
    }
}
