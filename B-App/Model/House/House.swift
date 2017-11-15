//
//  House.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/13/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import DKImagePickerController

class House: NSObject {

    var stageCompleted = 0
    var accomodationType = ""
    var country = ""
    var city = ""
    var street = ""
    var apartmentNo = ""
    var zipcode = ""
    var lattitude = ""
    var longitude = ""
    var aryphotos = [UIImage]()
    var assets = [DKAsset]()
    var desc = ""
    var areaSIze = ""
    var costType = ""
    var currency = ""
    var startPrice = ""
    var noticePeriod = ""
    var bookDateStart = ""
    var bookDateEnd = ""
    var profilePhoto: UIImage?
    var phoneNo = ""
    var countryCode = ""
    var isNoificationOn = Bool()
    static var newHouse = House()
}
