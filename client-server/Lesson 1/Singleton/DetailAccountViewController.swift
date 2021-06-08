//
//  DetailAccountViewController.swift
//  client-server
//
//  Created by Александр Гафаров on 06.06.2021.
//

import UIKit

class DetailAccountViewController: UIViewController {
    
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tokenLabel.text = AccountService.shared.token
        userIdLabel.text = String(AccountService.shared.userId)
        
    }
    
    
}
