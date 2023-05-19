//
//  RegisterView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel: RegisterViewViewModel
    
    init(viewModel: RegisterViewViewModel = RegisterViewViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       backgroundColor: .orange,
                       paddingTop: 80)
            .offset(y: -50)
            
            Form {
                TextField("Your Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Your email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Create Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                }
                
                TLButton(
                    title: "Create Account",
                    backgroundColor: .green)
                {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}
