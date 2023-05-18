//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
