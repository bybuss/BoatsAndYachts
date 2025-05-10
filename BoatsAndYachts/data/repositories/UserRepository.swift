//
//  UserRepository.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation

class UserRepository {
    static let shared = UserRepository()
    private let usersFileName = "users.json"

    func getCurrentUser() -> User? {
        return loadUsers().first
    }
    
    func loadUsers() -> [User] {
        if let url = Bundle.main.url(
            forResource: usersFileName,
            withExtension: nil
        ) {
            do {
                let data = try Data(contentsOf: url)
                let users = try JSONDecoder().decode(
                    [User].self,
                    from: data
                )
                return users
            } catch {
                print("Ошибка загрузки пользователей: \(error)")
                return []
            }
        }
        return []
    }
    
    func saveUsers(_ users: [User]) {
        if let url = Bundle.main.url(
            forResource: usersFileName,
            withExtension: nil
        ) {
            do {
                let data = try JSONEncoder().encode(users)
                try data.write(to: url)
            } catch {
                print("Ошибка сохранения пользователей: \(error)")
            }
        }
    }
}
