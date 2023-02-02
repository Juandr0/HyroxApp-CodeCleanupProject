//
//  FirebaseData.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-01.
//

import Foundation

struct User : Codable, Identifiable {
    
    var id : String
    var date : String
    var distance : String
    var time : String
    var fitnessLevel : String
    
}
