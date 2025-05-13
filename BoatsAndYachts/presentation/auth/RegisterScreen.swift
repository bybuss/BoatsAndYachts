//
//  RegisterScreen.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 12.05.2025.
//

import SwiftUI

struct RegisterScreen: View {
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            TextField("Имя", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Пароль", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Зарегистрироваться") {
                self.viewModel.register()
            }
            .disabled(viewModel.name.isEmpty || viewModel.email.isEmpty || viewModel.password.isEmpty)
        }
        .padding()
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen(viewModel: AuthViewModel()) 
    }
}
