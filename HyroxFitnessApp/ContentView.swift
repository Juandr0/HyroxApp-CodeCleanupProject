//
//  ContentView.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-09.
//

import SwiftUI
import Firebase

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct ContentView: View {
    @EnvironmentObject var dataManager : DataManager
    @State var email : String = ""
    @State var password : String = ""
    @State var userIsLoggedIn = false
    
    var body: some View {
 
        VStack {
            Spacer()
            LogoView()
            TitleView()
              // Spacer()
            
            TextField("Email address",
                    text: $email)
            .padding()
            .background(lightGreyColor)
            TextField("Password...",
                    text: $password)
            .padding()
            .background(lightGreyColor)
            Spacer()

            HStack{
                Button(action: {
                    register()
                }) {
                    Text("Register")
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                        .font(.largeTitle)
                }
                .background(Color.red)
                .cornerRadius(15.0)
                .fullScreenCover(isPresented: $userIsLoggedIn, content: {
                    WorkOutView()
                })
                
                Button(action: {
                    login()
                }) {
                    Text("Sign In")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                }
                .background(Color.yellow)
                .cornerRadius(15.0)
                .fullScreenCover(isPresented: $userIsLoggedIn, content: {
                    WorkOutView()
                })
            
            }
            Spacer()
            
        }
        .padding()
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    //userIsLoggedIn.toggle()
                }
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                            print("error signing in \(error)")
                        } else {
                            print ("Signed in \(Auth.auth().currentUser?.uid)")
                            userIsLoggedIn.toggle()
                        }
        }
        guard !email.isEmpty, !password.isEmpty else { return}
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                            print("error registering \(error)")
                        } else {
                            print ("Registered \(Auth.auth().currentUser?.uid)")
                            userIsLoggedIn.toggle()
                                
                        }
        }
        
        guard !email.isEmpty, !password.isEmpty else { return}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LogoView: View {
    var body: some View {
        Image(systemName: "figure.highintensity.intervaltraining")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 175)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
            .foregroundColor(.green)
    }
}

struct TitleView: View {
    var body: some View {
        Text("Prepare For Hyrox")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}
