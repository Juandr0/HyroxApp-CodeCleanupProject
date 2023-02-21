//
//  ViewModel.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-01.
//

import Foundation
import Firebase
import FirebaseFirestore

class ViewModel: ObservableObject {
    
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid
    
    @Published var users = [User]()
    
    init() {
        fetchData()
    }
    
    func addData(user: User) {
        guard let uid = uid else {
            print("Error: User is not logged in.")
            return
        }
        
        do {
            let _ = try db.collection("Users").document(uid).setData(from: user)
        } catch let error {
            print("Error writing user to Firestore: \(error.localizedDescription)")
        }
    }
    
    func delete(users: User) {
        guard let uid = uid, let id = users.id else {
            print("Error: User ID is nil or user is not logged in.")
            return
        }
        
        if uid != id {
            print("Error: User can only delete their own data.")
            return
        }
        
        db.collection("Users").document(id).delete() { error in
            if let error = error {
                print("Error deleting user: \(error)")
                return
            }
            print("User successfully deleted")
        }
    }
    
    func fetchData() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        db.collection("Users").whereField(FieldPath.documentID(), isEqualTo: userId)
            .addSnapshotListener { snapshot, err in
                guard let snapshot = snapshot else {return}
                
                if let err = err {
                    print("Error getting document \(err)")
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
                            print("Error decoding item: \(error)")
                        }
                    }
                }
            }
    }

}

    

    

