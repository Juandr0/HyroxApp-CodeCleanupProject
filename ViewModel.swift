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
    
    func addData(date: Date, fitnessLevel: String) {
          //  let data = User(name: itemName)
        
            do {
                _ = try db.collection("Users").addDocument(from: users)
            } catch {
                print("Error saving to DB")
            }
        }
    
//    func addData(date: Date, fitnessLevel: String) {
//        let data: [String: Any] = [
//            "date": Timestamp(date: date),
//            "fitnessLevel": fitnessLevel
//        ]
//        do {
//            let docRef = try db.collection("Users").document()
//            let user = User(id: docRef.documentID, fitnessLevel: fitnessLevel, date: date)
//            self.users.append(user)
//            try docRef.setData(data)
//        } catch {
//            print("Error saving to DB: \(error)")
//        }
//    }
    
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

    
 //   func fetchData() {
//        db.collection("Users").addSnapshotListener { (snapshot, error) in
 //           guard let documents = snapshot?.documents else {
 //               print("No documents")
  //              return
  //
  //          }
  //          self.users = documents.map { (queryDocumentSnapshot) -> User in
  //              let data = queryDocumentSnapshot.data()
  //              let fitnessLevel = data["fitnessLevel"] as? String ?? ""
  //              let date = (data["date"] as? Timestamp)?.dateValue() ?? Date()
  //
 //               return User(fitnessLevel: fitnessLevel, date: date)
 //
//            }
//        }
//
//    }
    
}

    

    

