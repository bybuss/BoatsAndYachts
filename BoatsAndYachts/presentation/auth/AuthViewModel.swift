//
//  AuthViewModel.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var isAuthenticated = false
    
    private let userRepository = UserRepository.shared
    
    func register() {
        if name.isEmpty || email.isEmpty {
            return
        }
        
        let newUser = User(
            id: UUID().uuidString,
            name: name,
            email: email,
            bonuses: 200
        )
        
        var users = userRepository.loadUsers()
        users.append(newUser)
        userRepository.saveUsers(users)
        
        isAuthenticated = true
    }
}
