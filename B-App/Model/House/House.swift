//
//  House.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/13/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class House: NSObject {

    var stageCompleted = Int()
    var accomodationType = ""
    var countrty = ""
    var city = ""
    var street = ""
    var apartmentNo = ""
    var zipcode = ""
    var lattitude = ""
    var longitude = ""
    var aryphotos = [UIImage]()
    var decription = ""
    var areaSIze = ""
    var costType = ""
    var currency = ""
    var startPrice = ""
    var noticePeriod = ""
    var bookDate = ""
    
    static var newHouse = House()
}
