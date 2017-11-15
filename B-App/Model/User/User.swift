//
//  User.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import Foundation

class User: NSObject, NSCoding  {

    var firstname: String = ""
    var lastname = ""
    var password = ""
    var email = ""
    var phone_no = ""
    var notificationEnable = Bool()
    var emailNotification = Bool()
    var userId = ""
    var token = ""
    
    var socialID = ""
    var imageURL = ""
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
        if let token = dictUser["token"] as? String{
            self.token = token
        }
    }
    
    class func setUserMe(_ dictUser:NSDictionary) {
        if let firstname = dictUser["first_name"] as? String{
            User.me.firstname = firstname
        }
        if let lastname = dictUser["last_name"] as? String{
            User.me.lastname = lastname
        }
        if let email = dictUser["email"] as? String{
            User.me.email = email
        }
        if let userId = dictUser["user_id"] as? String{
            User.me.userId = userId
        }
        if let token = dictUser["token"] as? String{
            User.me.token = token
        }
        saveUserProfile()
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
            self.email = email!
        }
        
        let userId : String? = aDecoder.decodeObject(forKey: "userId") as? String
        if userId != nil {
            self.userId = userId!
        }
        
        let token : String? = aDecoder.decodeObject(forKey: "token") as? String
        if token != nil {
            self.token = token!
        }
        
        let password : String? = aDecoder.decodeObject(forKey: "password") as? String
        if password != nil {
            self.password = password!
        }
    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.token, forKey: "token")
        aCoder.encode(self.firstname, forKey: "firstname")
        aCoder.encode(self.lastname, forKey: "lastname")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.userId, forKey: "userId")
        aCoder.encode(self.password, forKey: "password")

    }
    
    
    //MARK:- User default functions
    //MARK:-
    
    class func saveUserProfile() {
        let data = NSKeyedArchiver.archivedData(withRootObject: User.me)
        
        UserDefaults.standard.set(data, forKey: "Me")
        UserDefaults.standard.synchronize()
    }
    
    class func removeUserProfile(){
        UserDefaults.standard.removeObject(forKey: "Me")
        UserDefaults.standard.synchronize()
        User.me = User()
    }
    
    class func getMeArchiver() -> User? {
        if let data = UserDefaults.standard.object(forKey: "Me") as? Data {
            let me = NSKeyedUnarchiver.unarchiveObject(with: data)
            return me as? User
        }else{
            return nil
        }
    }
    
}
