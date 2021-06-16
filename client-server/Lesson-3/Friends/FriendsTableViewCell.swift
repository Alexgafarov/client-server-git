//
//  FriendsTableViewCell.swift
//  client-server
//
//  Created by Мария Гафарова on 15.06.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var iDLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
//    func configureWithUser(user: User) {
//        nameLabel.text = user.name
//
//            descriptionLabel.text = String(age) + " лет"
//     
//        if let image = user.avatar {
//            someImageView.image = image
//        }
//        saveUser = user
//        
//    }
    
    
}
