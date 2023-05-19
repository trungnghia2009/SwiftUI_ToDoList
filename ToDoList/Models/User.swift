//
//  User.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
