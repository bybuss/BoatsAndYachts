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
            VStack(spacing: 20) {
                TextField("Имя", text: $viewModel.name)
                TextField("Email", text: $viewModel.email)
                
                Button("Зарегистрироваться") {
                    self.viewModel.register()
                }
                .disabled(viewModel.name.isEmpty || viewModel.email.isEmpty)
            }
        }
    }
}

struct AuthScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthScreen(viewModel: AuthViewModel())
    }
}
