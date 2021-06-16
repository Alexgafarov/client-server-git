//
//  JSONData.swift
//  client-server
//
//  Created by Мария Гафарова on 15.06.2021.
//

import Foundation

class JSONData {
    
    private init () {}
    
    static let shared = JSONData()
    
    var friendsJSON: Data?
    var photoJSON: Data?
    var groupJSON: Data?

}
