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

    var name = ""
    var surname = ""
    var password = ""
    var email = ""
    var phone_no = ""
    var notificationEnable = Bool()
    var emailNotification = Bool()

    static var me = User()
    
}
