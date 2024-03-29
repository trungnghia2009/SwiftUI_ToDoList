//
//  Extension.swift
//  ToDoList
//
//  Created by trungnghia on 19/05/2023.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

extension Date {
    static func formatDate(date: TimeInterval) -> String {
        Date(timeIntervalSince1970: date).formatted(date: .abbreviated, time: .shortened)
    }
}
