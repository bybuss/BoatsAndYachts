//
//  HomeViewModel.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var promotions: [Promotion] = []
    private let promotionRepository = PromotionRepository()
    private let userRepository = UserRepository.shared
    
    init() {
        promotions = promotionRepository.loadPromotions()
    }
    
    func addBonuses(amount: Int) {
        if let user = userRepository.getCurrentUser() {
            var updatedUser = user
            updatedUser.bonuses += amount
            
            var users = userRepository.loadUsers()
            if let index = users.firstIndex(where: { $0.id == user.id }) {
                users[index] = updatedUser
                userRepository.saveUsers(users)
            }
        }
    }
}
