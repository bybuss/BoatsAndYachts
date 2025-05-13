//
//  User.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation

struct User: Codable, Equatable {
    let id: String
    let name: String
    let email: String
    let passwordHash: String
    var bonuses: Int
}
