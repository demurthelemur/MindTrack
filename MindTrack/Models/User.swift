//
//  User.swift
//  MindTrack
//
//  Created by Demir Dereli on 8.09.2023.
//

import Foundation

class User: ObservableObject, Codable {
    var id: String
    var name: String
    var lastName: String
    var email: String
    @Published var points: Int
    var petType: String
    
    static var devUser = User(id: "1", name: "demir", lastName: "dereli", email: "derelidemir123@gmail.com",  points: 12, petType: "squirtle")
    
    //Create a new user
    init(id: String, name: String, lastName: String, email: String, points: Int = 0, petType: String = "pikachu") {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.email = email
        self.points = points
        self.petType = petType
    }
    
    var petState: String {
        if petType == PikachuModel().firstEvo {
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
        case _id, firstName, lastName, email, point, petType
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: ._id)
        try container.encode(name, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email, forKey: .email)
        try container.encode(points, forKey: .point)
        try container.encode(petType, forKey: .petType)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: ._id)
        name = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decode(String.self, forKey: .email)
        points = try container.decode(Int.self, forKey: .point)
        petType = try container.decode(String.self, forKey: .petType)
    }
    
    static func createUserFromAppData() -> User{
        let id = UserDefaults.standard.string(forKey: "id")
        let name = UserDefaults.standard.string(forKey: "name")
        let lastName = UserDefaults.standard.string(forKey: "lastName")
        let email = UserDefaults.standard.string(forKey: "email")
        let points = UserDefaults.standard.integer(forKey: "points")
        let petType = UserDefaults.standard.string(forKey: "petType")

        return User(id: id!, name: name!, lastName: lastName!, email: email!, points: points, petType: petType!)
        
    }
    
    //Get User Points
    //Get User Friends
    //Sync Data to Backend
}
