//
//  SignInRegister.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-26.
//

import SwiftUI
import FirebaseAuth

class SignInRegister: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var isSignedIn = false
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil , error == nil else {
                return
            }
            // Success
            print("User signed in")
            self.isSignedIn.toggle()
        }
    }
    
    func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            
            //Success
            print("Registration successful")
            self.isSignedIn.toggle()
        
        }
    }
    
    func signOut() {
            let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
                print("User is signed out")
                self.isSignedIn.toggle()
                

            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)
     
            }
        }
    
}
