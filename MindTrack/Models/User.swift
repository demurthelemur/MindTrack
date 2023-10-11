//
//  User.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import Foundation

class User: ObservableObject, Codable {
    var name: String
    var lastName: String
    var password: String
    var email: String
    var birthDate: Date
    @Published var points: Int
    var petType: String
    
    static var devUser = User(name: "demir", lastName: "dereli", password: "testpassword", email: "derelidemir123@gmail.com", petType: "Pikachu")
    
    //Create a new user
    init(name: String, lastName: String, password: String, email: String, birthDate: Foundation.Date = Date.now, points: Int = 0, petType: String = "Pikachu") {
        self.name = name
        self.lastName = lastName
        self.password = password
        self.email = email
        self.birthDate = birthDate
        self.points = points
        self.petType = petType
    }
    
    var petState: String {
        if petType == "Pikachu" {
            if points < 0 {
                return PikachuModel().pikachuBase
            } else if points < 100 {
                return PikachuModel().pikachuFirstEVO
            } else {
                return PikachuModel().pikachuSecondEVO
            }
        }
        return "Charizard"
    }
    
    enum CodingKeys: CodingKey {
        case name, lastName, password, email, birthDate, points, petType
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(password, forKey: .password)
        try container.encode(email, forKey: .email)
        try container.encode(birthDate, forKey: .birthDate)
        try container.encode(points, forKey: .points)
        try container.encode(petType, forKey: .petType)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        lastName = try container.decode(String.self, forKey: .lastName)
        password = try container.decode(String.self, forKey: .password)
        email = try container.decode(String.self, forKey: .email)
        birthDate = try container.decode(Date.self, forKey: .birthDate)
        points = try container.decode(Int.self, forKey: .points)
        petType = try container.decode(String.self, forKey: .petType)
    }
    
    
    
    //Get User Points
    //Get User Friends
    //Sync Data to Backend
}
