//
//  Constant.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import Foundation
import UIKit


let API_Signup = "signup"
let API_Login = "user/login"

let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
let tabbarStoryboard = UIStoryboard(name: "TabBar", bundle: nil)
let bookingStoryboard = UIStoryboard(name: "Booking", bundle: nil)
let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
let AddHouseStoryboard = UIStoryboard(name: "AddHouse", bundle: nil)

let colorBlueBtn = UIColor(red: 88/255, green: 193/255, blue: 207/255, alpha: 1)

let InterestDetails: [String:Any] = ["title":"What are you interested in?","detail":[["subtitle":"Advertise","content":"I want to give an ad for my business","button":"Advertise"],["subtitle":"Search for an ad","content":"I am interested in searching for an ad","button":"Search for an ad"]]]
let advertiseDetails: [String:Any] = ["title":"What type of ad do you want to submit?","detail":[["subtitle":"Place an ad to rent your house","content":"We will inform you once someone sends you a message","button":"Add an ad"],["subtitle":"Rent a house for advertising","content":"We will inform you once someone sends you a message","button":"Add a house"]]]
let SearchDetails: [String:Any] = ["title":"What type of ads you are looking for?","detail":[["subtitle":"Search a house for advertising","content":"We will inform you once someone sends you a message","button":"Search house"],["subtitle":"Search an ad for my house","content":"We will inform you once someone sends you a message","button":"Search ad"]]]
