//
//  UserInfoCell.swift
//  ios-task
//
//  Created by Waseem Nasir on 11/28/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SDWebImage

class UserInfoCell: UITableViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    var user : User?
    var avatarUrl: String?
    
    func configureCell() {
        if let user = self.user {
            usernameLbl.text = user.login
            emailLbl.text = user.email
            emailLbl.isHidden = true
            avatarImg.sd_setImage(with: URL(string: user.avatar_url ?? ""))
            avatarImg.setRounded()
        }
    }
}
