//
//  SignInRegister.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-26.
//

import SwiftUI
import FirebaseAuth

class AuthenticationHandler: ObservableObject {
    
    @Published var errorMessage: String = ""
    @Published var isSignedIn = false
    
    let authenticationHandler = Auth.auth()
    
    func register(email: String, password: String) {
        authenticationHandler.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            
            if let result = result {
                self.isSignedIn.toggle()
            }
            
        }
    }
    
    func signIn(email: String, password: String) {
        authenticationHandler.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }

            if let result = result {
                self.isSignedIn.toggle()
            }
            
        }
    }

    
    func signOut() {
            do {
              try authenticationHandler.signOut()
                self.isSignedIn.toggle()

            } catch let error as NSError {
                self.errorMessage = error.localizedDescription

            }
        }
    
}




