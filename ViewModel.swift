//
//  ViewModel.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-01.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var list = [User]()
    
    func deleteData(userDelete: User) {
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(userDelete.id).delete { error in
            
            if error == nil {
                self.list.removeAll { user in
                    return user.id == userDelete.id
                }
            }
            else {
                
            }
            
        }
        
    }
    
    func addData(date: String,
                 distance: String,
                 time: String,
                 fitnessLevel: String) {
        
        let db = Firestore.firestore()
        
        db.collection("Users").addDocument(data: ["date":date,
                                                  "distance":distance,
                                                  "time":time,
                                                  "fitnessLevel":fitnessLevel]) { error in
            if error == nil {
                
                self.getData()
                
            }
            else {
                
            }
        }
        
    }
    
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("Users").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    self.list = snapshot.documents.map { d in
                        
                        return User(id: d.documentID,
                                    date: d["date"] as? String ?? "",
                                    distance: d["distance"] as? String ?? "",
                                    time: d["time"] as? String ?? "",
                                    fitnessLevel: d["fitnessLevel"] as? String ?? "")
                    }
                }
            } else {
                
            }
            
        }
        
    }
    
}
