//
//  ProfileScreen.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if let user = viewModel.user {
                    VStack(spacing: 20) {
                        Text("Имя: \(user.name)")
                        Text("Email: \(user.email)")
                        Text("Бонусы: \(user.bonuses)")
                        
                        Button("Выйти") {
                            viewModel.logout()
                        }
                    }
                    .padding()
                } else {
                    Text("Пользователь не найден")
                        .padding()
                }
            }
            .navigationTitle("Профиль")
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(viewModel: ProfileViewModel())
    }
}
