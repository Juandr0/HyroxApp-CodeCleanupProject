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
    
    func addData(date: String,
                 distance: String,
                 time: String,
                 fitnessLevel: String) {
        
        let users = User(date: date, distance: distance, time: time, fitnessLevel: fitnessLevel)
            
                do {
                    _ = try db.collection("Users").addDocument(from: users)
                } catch {
                    print("Error saving to DB")
                }
        
    }
    
    func delete(user: User) {
            db.collection("Users").document(user.id!).delete() { error in
                if let error = error {
                    print("Error deleting user: \(error)")
                    return
                }
                print("User successfully deleted")
            }
        }
    
    func fetchData() {
            db.collection("Users").addSnapshotListener { (snapshot, error) in
                if let error = error {
                    print("Error fetching data from Firestore: \(error)")
                    return
                }
                
                self.users = snapshot!.documents.compactMap { document in
                    let data = document.data()
                    let date = data["date"] as! String
                    let distance = data["distance"] as! String
                    let time = data["time"] as! String
                    let fitnessLevel = data["fitnessLevel"] as! String
                    
                    return User(id: document.documentID, date: date, distance: distance, time: time, fitnessLevel: fitnessLevel)
            }
        }
    }
}
    

