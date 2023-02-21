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
    
    @Published var users = [User]()
    
    init() {
        fetchData()
    }
    
    func addData(user: User) {
        let db = Firestore.firestore()
        do {
            let _ = try db.collection("Users").addDocument(from: user)
        } catch let error {
            print("Error writing user to Firestore: \(error.localizedDescription)")
        }
    }
    
    func delete(users: User) {
        guard let id = users.id else {
            print("Error: User ID is nil.")
            return
        }
        db.collection("Users").document(id).delete() { error in
            if let error = error {
                print("Error deleting workout: \(error)")
                return
            }
            print("Workout successfully deleted")
        }
    }
    
    func fetchData() {
            db.collection("Users").addSnapshotListener { snapshot, err in
                guard let snapshot = snapshot else {return}
                
                if let err = err {
                    print("Error getting document \(err)")
                } else {
                    self.users.removeAll()
                    for document in snapshot.documents {

                        let result = Result {
                            try document.data(as: User.self)
                        }
                        switch result  {
                        case .success(let item)  :
                            self.users.append(item)
                        case .failure(let error) :
                            print("Error decoding item: \(error)")
                        }
                    }
                }
            }
        }

    
}

    

    

