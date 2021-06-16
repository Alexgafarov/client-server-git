//
//  Photo.swift
//  client-server
//
//  Created by Мария Гафарова on 10.06.2021.
//

import Foundation


struct Photo: Codable {
    let height: Int
    let type: String
    let url: String
    let width: Int
}

struct PhotoInfo: Codable {
    let albumId: String
    let date: Int
    let hasTags: Int
    let id: Int
    let lat: String
    let long: String
    let ownerId: Int
    let postId: Int
    let sizes: [Photo]
}

struct PhotoCount: Codable {
    let count: Int
    let items:[PhotoInfo]
}

struct PhotoResponse: Codable {
    let response: [PhotoCount]
}
