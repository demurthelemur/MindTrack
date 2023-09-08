//
//  User.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import Foundation

class User: Codable {
    var name: String
    var lastName: String
    var password: String
    var email: String
    var birthDate: Date
    var points: Int? = nil
    var petType: String? = nil
    
    init(name: String, lastName: String, password: String, email: String, birthDate: Foundation.Date = Date.now) {
        self.name = name
        self.lastName = lastName
        self.password = password
        self.email = email
        self.birthDate = birthDate
    }
    
    //Get User Points
    //Get User Friends
    //Sync Data to Backend
}
