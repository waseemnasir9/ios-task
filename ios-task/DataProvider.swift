//
//  DataProvider.swift
//  ios-task
//
//  Created by Waseem Nasir on 11/28/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import Alamofire

protocol DataProtocol : AnyObject {
    func userReceived(user:User?)
}

class DataProvider{
    
    static let shared = DataProvider()
    private let baseUrl = "https://api.github.com/"
    weak var delegate: DataProtocol?
    
    private init(){}
    
    internal func getUser(with:String){
        
        Alamofire.request(baseUrl + "users/" + with, method:.get, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseData(completionHandler: {   respones in
            switch respones.result {
                
            case .success(let value):
                let decoder = JSONDecoder()
                
                do{
                    let response = try decoder.decode(User.self, from: value)
                    if response.login != nil{
                        if let delegate = self.delegate {
                            delegate.userReceived(user: response)
                        }
                    }else{
                        if let delegate = self.delegate {
                            delegate.userReceived(user: nil)
                        }
                    }
                }catch let error{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error)
            }
        })
        
    }
    
    internal func getFollowers(forUser:String, completion: @escaping (_ users: [User])->() ){
        
        Alamofire.request(baseUrl + "users/" + forUser + "/followers", method:.get, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseData(completionHandler: {   response in
            switch response.result {
                
            case .success(let value):
                let decoder = JSONDecoder()
                
                do{
                    let users = try decoder.decode([User].self, from: value)
                    completion(users)
                }catch let error{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error)
            }
        })
        
    }
    
    
}
