//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else { return }
        
        // Try to login
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error {
                self?.errorMessage = error.localizedDescription
                return
            }
            print("Successfully")
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        // Check blank space
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty  else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        // email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        // Password
        guard password.count > 5 else {
            errorMessage = "Password requires more than 5 characters"
            return false
        }
        
        return true
    }
    
}
