//
//  ViewModel.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-01.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class DatabaseHandler: ObservableObject {
    
    let firestoreDB = Firestore.firestore()
    let currentUserID = Auth.auth().currentUser?.uid
    
    @Published var users = [User]()
    
    init() {
        fetchUserData()
    }
    
    // Adds workout data to DB
    func addData(user: User) {
        guard let uid = currentUserID else {
            let errorMessage = "Error: User is not logged in."
            showMessage(errorMessage)
            return
        }
        
        do {
            let _ = try firestoreDB.collection("Users").document(currentUserID!).collection("Workouts").addDocument(from: user)
        } catch let error {
            let errorMessage = "Error writing user to Firestore: \(error.localizedDescription)"
            showMessage(errorMessage)
        }
    }
    
    // Deletes the user workout data from DB
    func delete(users: User) {
        guard let uid = currentUserID, let id = users.id else {
            let errorMessage = "Error: User ID is nil or user is not logged in."
            showMessage(errorMessage)
            return
        }
        
        if currentUserID != id {
            let errorMessage = "Error: User can only delete their own data."
            showMessage(errorMessage)
            return
        }
        
        firestoreDB.collection("Users").document(id).delete() { error in
            if let error = error {
                let errorMessage = "Error deleting user: \(error)"
                self.showMessage(errorMessage)
                return
            }
            let message = "User successfully deleted"
            self.showMessage(message)
        }
    }
    
    // Resets the data if another user has been logged in, then fetches the current user data
    func fetchUserData() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        firestoreDB.collection("Users").document(userId).collection("Workouts")
            .addSnapshotListener { snapshot, err in
                guard let snapshot = snapshot else { return }
                
                if let err = err {
                    let message = "Error getting document \(err)"
                    self.showMessage(message)
                } else {
                    self.users.removeAll()
                    for document in snapshot.documents {
                        let result = Result {
                            try document.data(as: User.self)
                        }
                        switch result {
                        case .success(let item):
                            self.users.append(item)
                        case .failure(let error):
                            let errorMessage = "Error decoding item: \(error)"
                            self.showMessage(errorMessage)
                        }
                    }
                }
            }
    }
    
    private func showMessage(_ message: String) {
        let errorAlert = AlertHandler(errorMessage: message)
        // Present the error alert using your preferred method (e.g., using SwiftUI's sheet)
    }
    
}



