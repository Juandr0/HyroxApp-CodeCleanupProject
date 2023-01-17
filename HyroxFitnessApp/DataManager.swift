//
//  DataManager.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-01-11.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        users.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Users")
        ref.getDocuments { snapshot, error in
                if let error = error {
                                print("Error fetching data \(error)")
                } else {
                    if let snapshot = snapshot {
                        for document in snapshot.documents {
                            let data = document.data()
                            
                            let id = data["id"] as? String ?? ""
                            let fitnesslevel = data["fitnesslevel"] as? String ?? ""
                            
                            let user = User(id: id, fitnesslevel: fitnesslevel)
                            self.users.append(user)
                        
                    }
                }
            }
        }
    }
}
