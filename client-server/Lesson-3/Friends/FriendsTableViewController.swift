//
//  FriendsTableViewController.swift
//  client-server
//
//  Created by Мария Гафарова on 15.06.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let friendsTableViewCellReuse = "FriendsTableViewCell"
    let networkService: FriendsNetworkService = FriendsNetworkService()
    var friendModel: UserCount?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retriveDataFromNetwork()
//        cellRegister()
        
    }

    func retriveDataFromNetwork() {
            networkService.downloadDataFromServer(completion: { data, error in
                guard let data = data else { return }
                
                guard let model = try? JSONDecoder().decode(UserCount.self, from: data) else { return }
                
                self.friendModel = model
            })
        }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendModel?.items.count ?? 0
    }

    
//    func cellRegister() {
//        self.tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: friendsTableViewCellReuse)
//    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsTableViewCellReuse, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()}

        let friend: User? = friendModel?.items[indexPath.row]
        
        cell.fullNameLabel.text = "\(friend!.first_name) \(friend!.last_name)"
        
        return cell
    }
    

  


}
