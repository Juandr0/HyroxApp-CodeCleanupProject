//
//  SignInRegister.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-26.
//

import SwiftUI
import FirebaseAuth

class AuthenticationHandler: ObservableObject {
    
    @Published var isSignedIn = false
    let authenticationHandler = Auth.auth()
   
    
    func register(email: String, password: String) {
        authenticationHandler.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error)
                return
            }
            
            if let result = result {
                ("User \(result.user.uid) registered")
                self.isSignedIn.toggle()
            }
            
        }
    }
    
    func signIn(email: String, password: String) {
        authenticationHandler.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error)
                return
            }

            if let result = result {
                print("User \(result.user.uid) signed in")
                self.isSignedIn.toggle()
            }
            
        }
    }

    
    func signOut() {
            do {
              try authenticationHandler.signOut()
                print("User is signed out")
                self.isSignedIn.toggle()
                

            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)

            }
        }
    
}
