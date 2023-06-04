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
    
    
    var body: some View {
        VStack {
            EmptyView()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage),
                dismissButton: .default(Text("OK")) {
                    resetErrorMessage()
                }
            )
        }
        .onChange(of: authHandler.errorMessage) { errorMessage in
            showAlert = !errorMessage.isEmpty
        }
    }
    
    
    private func resetErrorMessage() {
        authHandler.errorMessage = ""
    }
}
