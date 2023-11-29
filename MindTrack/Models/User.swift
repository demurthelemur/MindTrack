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
    var email: String
    @Published var points: Int
    var petType: String
    
    static var devUser = User(name: "demir", lastName: "dereli", email: "derelidemir123@gmail.com",  points: 12, petType: "Squirtle")
    
    //Create a new user
    init(name: String, lastName: String, email: String, points: Int = 0, petType: String = "Pikachu") {
        self.name = name
        self.lastName = lastName
        self.email = email
        self.points = points
        self.petType = petType
    }
    
    var petState: String {
        if petType == "Pikachu" {
            if points < 0 {
                return PikachuModel().firstEvo
            } else if points < 100 {
                return PikachuModel().secondEvo
            } else {
                return PikachuModel().thirdEvo
            }
        } else if petType == "charmander" {
            if points < 0 {
                return CharmanderModel().firstEvo
            } else if points < 100 {
                return CharmanderModel().secondEvo
            } else {
                return CharmanderModel().thirdEvo
            }
        } else {
            if points < 0 {
                return SquirtleModel().firstEvo
            } else if points < 100 {
                return SquirtleModel().secondEvo
            } else {
                return SquirtleModel().thirdEvo
            }
        }
    }
    
    enum CodingKeys: CodingKey {
        case name, lastName, password, email, points, petType
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email, forKey: .email)
        try container.encode(points, forKey: .points)
        try container.encode(petType, forKey: .petType)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decode(String.self, forKey: .email)
        points = try container.decode(Int.self, forKey: .points)
        petType = try container.decode(String.self, forKey: .petType)
    }
    
    static func createUserFromAppData() -> User{
        var name = UserDefaults.standard.string(forKey: "name")
        var lastName = UserDefaults.standard.string(forKey: "lastName")
        var email = UserDefaults.standard.string(forKey: "email")
        var points = UserDefaults.standard.integer(forKey: "points")
        var petType = UserDefaults.standard.string(forKey: "petType")
        
        return User(name: name!, lastName: lastName!, email: email!, points: points, petType: petType!)
        
    }
    
    //Get User Points
    //Get User Friends
    //Sync Data to Backend
}
