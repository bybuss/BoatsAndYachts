//
//  User.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation

struct User: Codable, Equatable {
    var id: String
    var name: String
    var email: String
    var bonuses: Int
    
    static func == (firstUser: User, secondUser: User) -> Bool {
        return firstUser.id == secondUser.id
    }

}
