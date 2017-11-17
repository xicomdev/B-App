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
    var address = ""
    var lattitude : Double = 0.0
    var longitude : Double = 0.0
    var aryphotos = [UIImage]()
    var aryImgUrls = [String]()
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
    var houseId = Int()

    var ownerInfo = User()
    
    static var newHouse = House()
    
    
    class func getMyAds(_ aryAds: NSArray) -> [House] {
        var aryHouse = [House]()
        for dict in aryAds  {
            let objHouse = House()
            let dictHouse = dict as! NSDictionary
            objHouse.accomodationType = dictHouse["category"] as! String
            objHouse.address = dictHouse["address"] as! String
            objHouse.houseId = dictHouse["billboard_id"] as! Int
            if let lat = dictHouse.value(forKeyPath: "coordinate.latitude") as? String {
                objHouse.lattitude = Double(lat)!
            }else {
                objHouse.lattitude = dictHouse.value(forKeyPath: "coordinate.latitude") as! Double
            }
            
            if let long = dictHouse.value(forKeyPath: "coordinate.longitude") as? String {
                objHouse.longitude = Double(long)!
            }else {
                objHouse.longitude = dictHouse.value(forKeyPath: "coordinate.longitude") as! Double
            }
            
            objHouse.aryImgUrls = dictHouse["photos"] as! [String]
            objHouse.ownerInfo = User.getOwnerInfo(dictHouse["seller"] as! NSDictionary)
            let height = dictHouse.value(forKeyPath: "board_size.height") as! Int
            let width = dictHouse.value(forKeyPath: "board_size.width") as! Int
            objHouse.areaSIze = "\(height*width)"
            let sales = (dictHouse["sales"] as! NSArray)[0] as! NSDictionary
            objHouse.startPrice = sales["price"] as! String
            objHouse.costType = sales["unit"] as! String
            objHouse.bookDateStart = sales.value(forKeyPath: "times.from") as! String
            objHouse.bookDateEnd = sales.value(forKeyPath: "times.until") as! String
            aryHouse.append(objHouse)
        }
        return aryHouse
    }
}
