//
//  ViewController.swift
//  ios-task
//
//  Created by Waseem Nasir on 11/28/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataProvider.shared.delegate = self;
    }

    @IBAction func findUserTapped(_ sender: Any) {
        
        if usernameText.text != "" {
            DataProvider.shared.getUser(with: usernameText.text ?? "")
        }
        else{
            Commons.showAlert(title: "Error", message: "Please enter a username", VC: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? UserDetailVC{
            vc.user = self.user
        }
    }
    
}

extension SearchVC: DataProtocol {

    func userReceived(user: User?) {
        
        if user != nil {
            self.user = user
            self.performSegue(withIdentifier: "showUserInfo", sender: self)
        }
        else{
            Commons.showAlert(title: "Error", message: "User not found", VC: self)
        }
    }
    
    
    
}


