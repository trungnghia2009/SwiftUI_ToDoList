//
//  LoginView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // Header
            HeaderView()
            
            // Login
            Form {
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                Button {
                    // Attempt to log in
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                        Text("Log In")
                            .foregroundColor(.white)
                            .bold()
                    }
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
