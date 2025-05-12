//
//  ContentView.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
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
            HomeScreen(viewModel: HomeViewModel())
                .tabItem {
                    Image(systemName: "sailboat")
                    Text("Акции")
                }
            
            ProfileScreen(viewModel: ProfileViewModel())
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Профиль")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authViewModel: AuthViewModel())
    }
}
