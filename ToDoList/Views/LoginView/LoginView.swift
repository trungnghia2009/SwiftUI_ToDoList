//
//  LoginView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewViewModel
    
    init(viewModel: LoginViewViewModel = LoginViewViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "To Do List",
                       subtitle: "Get things done",
                       angle: 15,
                       backgroundColor: .pink)
            
            // Login
            Form {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                }
                TLButton(
                    title: "Login",
                    backgroundColor: .blue)
                {
                    viewModel.login()
                }

            }
            .padding()
            
            Spacer()
            
            // Create Account
            VStack {
                Text("New around here?")
                NavigationLink("Create An Account") {
                    RegisterView()
                }
            }
            .padding(.bottom, 50)
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
