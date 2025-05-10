//
//  ProfileViewModel.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    private let userRepository = UserRepository.shared
    
    init() {
        user = userRepository.getCurrentUser()
    }
    
    func logout() {
        userRepository.saveUsers([])
        user = nil
    }
}
