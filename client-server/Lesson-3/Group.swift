//
//  Group.swift
//  client-server
//
//  Created by Мария Гафарова on 10.06.2021.
//

import Foundation


struct Group: Codable {
    let adminLevel: Int
    let id: Int
    let isAdmin: Int
    let isAdvertiser: Int
    let isClosed: Int
    let isMember: Int
    let name: String
    let photo100: String
    let photo200: String
    let photo50: String
    let screenName: String
    let type: String
}

struct GroupCount: Codable {
    let count: Int
    let items:[Group]
}

struct GroupResponse: Codable {
    let response:[GroupCount]
}
