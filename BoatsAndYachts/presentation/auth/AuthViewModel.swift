//
//  AuthViewModel.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    
    private let userRepository = UserRepository.shared
    
    func register() {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else { return }
        
        let hashedPassword = hashPassword(password)
        let newUser = User(
            id: UUID().uuidString,
            name: name,
            email: email,
            passwordHash: hashedPassword,
            bonuses: 200
        )
        
        var users = userRepository.loadUsers()
        users.append(newUser)
        userRepository.saveUsers(users)
        isAuthenticated = true
    }
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else { return }
        
        let users = userRepository.loadUsers()
        if let user = users.first(where: { $0.email == email }) {
            let inputHash = hashPassword(password)
            if user.passwordHash == inputHash {
                userRepository.saveCurrentUser(user)
                isAuthenticated = true
            }
        }
    }
    
    private func hashPassword(_ password: String) -> String {
        return Data(password.utf8).base64EncodedString()
    }
}
