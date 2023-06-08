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
    
    @EnvironmentObject var signInRegister: AuthenticationHandler
    var body: some View {
        if signInRegister.isSignedIn {
            NavbarHandler()
        } else {
            UserLoginView()
        }
    }
    
    
}

struct CredentialsView: View {
    @Binding var email : String
    @Binding var password: String
    
    var body: some View {
        inputFields(email: $email, password: $password)
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

struct inputFields: View {
    @Binding var email : String
    @Binding var password : String
    
    var body: some View {
        VStack {
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
        }
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
