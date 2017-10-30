//
//  User.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import Foundation

class User: NSObject {

    var firstname: String = ""
    var lastname = ""
    var password = ""
    var email = ""
    var phone_no = ""
    var notificationEnable = Bool()
    var emailNotification = Bool()
    var userId = ""

    static var me = User()
    
    override init()
    {
        userId = ""
        firstname = ""
        lastname = ""
        password  = ""
        email  = ""
        phone_no = ""
        
    }
    
    convenience init(dictUser : NSDictionary) {
        self.init()
        
       
        if let firstname = dictUser["first_name"] as? String{
            self.firstname = firstname
        }
        if let lastname = dictUser["last_name"] as? String{
            self.lastname = lastname
        }
        if let email = dictUser["email"] as? String{
            self.email = email
        }
        if let userId = dictUser["id"] as? String{
            self.userId = userId
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        
        let firstname: String? = aDecoder.decodeObject(forKey: "firstname") as? String
        if firstname != nil {
            self.firstname = firstname!
        }
        
        let lastname : String? = aDecoder.decodeObject(forKey: "lastname") as? String
        if lastname != nil {
            self.lastname = lastname!
        }
        
        let email : String? = aDecoder.decodeObject(forKey: "email") as? String
        if email != nil {
            self.lastname = email!
        }
        
        let userId : String? = aDecoder.decodeObject(forKey: "userId") as? String
        if userId != nil {
            self.userId = userId!
        }
    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.firstname, forKey: "firstname")
        aCoder.encode(self.lastname, forKey: "lastname")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.userId, forKey: "userId")

    }
    
}
