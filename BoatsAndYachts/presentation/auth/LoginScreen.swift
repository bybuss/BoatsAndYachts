//
//  LoginScreen.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 12.05.2025.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Пароль", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Войти") {
                self.viewModel.login()
            }
            .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
        }
        .padding()
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(viewModel: AuthViewModel())
    }
}
