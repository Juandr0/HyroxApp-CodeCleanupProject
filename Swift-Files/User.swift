//
//  FirebaseData.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-01.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct User: Codable, Identifiable {
    @DocumentID var id: String?
   // var time: TimeInterval
    var fitnessLevel: String
    var date: Date
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd 'of' MMMM"
        return formatter.string(from: date)
    }
    
    
}
