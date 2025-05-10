//
//  Promotion.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation

struct Promotion: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let bonusAmount: Int
}
