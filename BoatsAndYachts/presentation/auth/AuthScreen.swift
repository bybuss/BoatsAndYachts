//
//  AuthScreen.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import SwiftUI

struct AuthScreen: View {
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LoginScreen(viewModel: viewModel)) {
                    Text("Вход")
                        .padding()
                }
                
                NavigationLink(destination: RegisterScreen(viewModel: viewModel)) {
                    Text("Регистрация")
                        .padding()
                }
            }
        }
    }
}

struct AuthScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthScreen(viewModel: AuthViewModel())
    }
}
