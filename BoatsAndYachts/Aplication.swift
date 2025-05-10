//
//  ContentView.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import SwiftUI

@main
struct BoatRentalApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.isAuthenticated || UserRepository.shared.getCurrentUser() != nil {
                MainTabView()
            } else {
                AuthScreen(viewModel: authViewModel)
            }
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeScreen(viewModel: HomeViewModel())
            }.tabItem {
                Image(systemName: "sailboat")
                Text("Акции")
            }
            
            NavigationView {
                ProfileScreen(viewModel: ProfileViewModel())
            }.tabItem {
                Image(systemName: "person.circle")
                Text("Профиль")
            }
        }
    }
}
