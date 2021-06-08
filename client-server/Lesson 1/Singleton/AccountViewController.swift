//
//  AccountViewController.swift
//  client-server
//
//  Created by Александр Гафаров on 06.06.2021.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var tokenTextField: UITextField!
    @IBOutlet weak var userIdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confirmButton(_ sender: Any) {
     
        guard let token = tokenTextField.text,
              let userIdString = userIdTextField.text,
              let userId = Int(userIdString)
              else {
                return
              }
    
        AccountService.shared.token = token
        AccountService.shared.userId = userId
        
    }
    
    
}
