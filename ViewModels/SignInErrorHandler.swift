//
//  SignInErrorHandler.swift
//  HyroxFitnessApp
//
//  Created by Alexander on 2023-06-03.
//

import SwiftUI

//Displays login error message as alert to notify the user what's wrong.
struct SignInErrorHandler: View {
    @ObservedObject var authHandler: AuthenticationHandler
    @Binding var email: String
    @Binding var password: String
    @Binding var showAlert: Bool
    
    //Conditions that decide what error message is shown
    private var errorMessage: String {
        switch (email.isEmpty, password.isEmpty) {
        case (true, true):
            return "Please enter email and password"
        case (false, true):
            return "Please enter password"
        case (true, false):
            return "Please enter email"
        case (false, false):
            return authHandler.errorMessage
        }
    }
    
    
    //Sends errormessage to AlertHandler to display it, then resets the errormessage
    var body: some View {
        VStack {
            if showAlert {
                AlertHandler(errorMessage: errorMessage, onDismiss: resetErrorMessage)
            } else {
                EmptyView()
            }
          
        }
        .onChange(of: authHandler.errorMessage) { errorMessage in
            showAlert = !errorMessage.isEmpty
        }
    }
    
    
    private func resetErrorMessage() {
        authHandler.errorMessage = ""
    }
}
