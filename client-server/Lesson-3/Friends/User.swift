//
//  User.swift
//  client-server
//
//  Created by Мария Гафарова on 10.06.2021.
//

import Foundation


struct City: Codable {
    let id: Int
    let title: String
}

struct User: Codable {
    let bdate: String?
    let can_access_closed: Bool
    let city: City?
    let first_name: String
    let id: Int
    let is_closed: Bool
    let last_name: String
    let nickname: String?
    let track_code: String
}

struct UserCount: Codable {
    let count: Int
    let items: [User]
}

struct UserResponse: Codable {
    let response: UserCount
}
