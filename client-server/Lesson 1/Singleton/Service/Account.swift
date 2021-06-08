//
//  Account.swift
//  client-server
//
//  Created by Александр Гафаров on 06.06.2021.
//

import Foundation

final class AccountService {
    
    private init () {}
    
    static let shared = AccountService()
    
    var token: String = ""
    var userId: Int = 0
}
