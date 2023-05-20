//
//  EditItemViewViewModel.swift
//  ToDoList
//
//  Created by trungnghia on 20/05/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EditItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    private let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func getItemInfo() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()

        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(id)
            .getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.title = data["title"] as? String ?? ""
                    
                    let itemDueDate = data["dueDate"] as? TimeInterval ?? 0
                    self?.dueDate = Date(timeIntervalSince1970: itemDueDate)
                }
            }
    }
    
    func save() {
        // Get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let updateItem = ToDoListItem(
            id: id,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(id)
            .setData(updateItem.asDictionary()) { error in
                if let error {
                    print("Error: \(error)")
                }
                print("Store item to db successfully")
            }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
