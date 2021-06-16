//
//  NetworkService.swift
//  client-server
//
//  Created by Мария Гафарова on 15.06.2021.
//

import Foundation

class FriendsNetworkService {
    func downloadDataFromServer(completion: (Data?, Error?) -> Void) {
        completion(JSONData.shared.friendsJSON, nil)
    }
}

//class PhotosNetworkService {
//    func downloadDataFromServer(completion: (Data?, Error?) -> Void) {
//        completion(JSONData.shared.photoJSON as! Data, nil)
//    }
//}
//
//class GroupsNetworkService {
//    func downloadDataFromServer(completion: (Data?, Error?) -> Void) {
//        completion(JSONData.shared.groupJSON as! Data, nil)
//    }
//}
