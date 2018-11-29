//
//  Commons.swift
//  ios-task
//
//  Created by Waseem Nasir on 11/28/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

class Commons{
    
    static let userInfoCell = "userInfoCell"
    
    static func showAlert(title:String, message: String, VC: UIViewController) {
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle:.alert)
        
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        VC.present(alertView, animated: true, completion: nil)
    }
}

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
