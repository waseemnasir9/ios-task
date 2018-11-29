//
//  UserDetailVC.swift
//  ios-task
//
//  Created by Waseem Nasir on 11/28/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SDWebImage

class UserDetailVC: UITableViewController {
    
    var user:User?
    var followers: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        getFollowers()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : self.followers?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UITableViewCell()
        headerView.textLabel?.text = section == 0 ? "User" : "Followers"
        headerView.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        headerView.backgroundColor = UIColor.white
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Commons.userInfoCell, for: indexPath) as! UserInfoCell
        
        if indexPath.section == 0 {
            cell.user = user;
        }
        else {
            if followers?.count ?? 0 > 0{
                cell.user = followers?[indexPath.row];
            }
        }
        cell.configureCell()
        return cell
    }
    
    func registerCell(){
        self.tableView.register(UINib(nibName: "UserInfoCell", bundle: nil), forCellReuseIdentifier: "userInfoCell")
    }
    
    func getFollowers(){
        DataProvider.shared.getFollowers(forUser: user?.login ?? "") { (users) in
            self.followers = users
            self.tableView.reloadData()
        }
    }
    
}

