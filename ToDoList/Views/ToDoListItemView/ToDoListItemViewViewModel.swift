//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// ViewModel for single to do list item view (each row in items list)
/// Secondary tab
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary()) { error in
                if let error {
                    print("Failed to update item : \(error)")
                    return
                }
                print("Update item successfully")
            }
    }
}
