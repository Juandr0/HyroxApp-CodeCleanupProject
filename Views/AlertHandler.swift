//
//  AlertHandler.swift
//  HyroxFitnessApp
//
//  Created by Alexander on 2023-06-04.
//

import SwiftUI

//Takes the given error message and displays it as an alert.
struct AlertHandler: View {
    
    let errorMessage: String
    let onDismiss: (() -> Void)?
    
    @State private var showAlert = true
    
    
    var body: some View {
        VStack {
            EmptyView()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage),
                dismissButton: .default(Text("OK")) {
                    showAlert=false
                    onDismiss?()
                }
            )
        }
    }
}
