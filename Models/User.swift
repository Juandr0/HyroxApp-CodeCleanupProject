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
    var fitnessLevel: String
    var date: Date
    var elapsedTime: TimeInterval?
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd 'of' MMMM"
        return formatter.string(from: date)
    }
    
    var elapsedTimeString: String {
            guard let elapsedTime = elapsedTime else { return "00:00:00" }
            
            let hours = Int(elapsedTime) / 3600
            let minutes = Int(elapsedTime) / 60 % 60
            let seconds = Int(elapsedTime) % 60
            
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    
    
}
