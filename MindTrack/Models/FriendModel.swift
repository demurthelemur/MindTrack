//
//  FriendModel.swift
//  MindTrack
//
//  Created by Demir Dereli on 20.12.2023.
//

import Foundation

class FriendModel: Identifiable, Codable {
    var id: String
    var friendId: String
    var name: String
    var petType: String
    var point: Int
    
    enum CodingKeys: CodingKey {
        case _id, friendId, name, petType, point
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: ._id)
        try container.encode(friendId, forKey: .friendId)
        try container.encode(name, forKey: .name)
        try container.encode(point, forKey: .point)
        try container.encode(petType, forKey: .petType)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: ._id)
        friendId = try container.decode(String.self, forKey: .friendId)
        name = try container.decode(String.self, forKey: .name)
        petType = try container.decode(String.self, forKey: .petType)
        point = try container.decode(Int.self, forKey: .point)
    }
}

typealias FriendModelArray = [FriendModel]
