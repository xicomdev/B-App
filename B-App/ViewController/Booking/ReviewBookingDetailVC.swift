//
//  ReviewBookingDetailVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import Kingfisher

class ReviewBookingDetailVC: UIViewController {

    @IBOutlet weak var lblNoOfDays: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    @IBOutlet weak var lblDates: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblOwnerName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var imgVw: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if House.selectedHouse != nil {
            if (House.selectedHouse?.aryImgUrls.count)! > 0 {
                imgVw.kf.setImage(with: URL(string: (House.selectedHouse?.aryImgUrls[0])!))
            }
            lblAddress.text = House.selectedHouse?.address
            lblOwnerName.text = House.selectedHouse?.ownerInfo.fullname
            lblArea.text = House.selectedHouse?.areaSIze
            lblNoOfDays.text = "for \(Booking.newBooking.noOFDays) days"
            let priceComponents = House.selectedHouse?.startPrice.components(separatedBy: CharacterSet(charactersIn: " "))
            let priceStr = priceComponents![0].replacingOccurrences(of: ",", with: "")
            let currencyStr = priceComponents![1]
            var perDayPrice = Int()
            switch (House.selectedHouse?.costType)! {
            case "Hourly":
                perDayPrice = Int(Double(priceStr)!) * 24
            case "Daily":
                perDayPrice = Int(Double(priceStr)!)
            case "Weekly":
                perDayPrice = Int(Double(priceStr)!) / 7
            default:
                perDayPrice = Int(Double(priceStr)!) / 30
            }
            lblCost.text = getCurrencySymbolFromCode(currencyStr) + "\(perDayPrice*Booking.newBooking.noOFDays)"
            lblDates.text = getDayAndDateString(getDateFromSimpleFormat(Booking.newBooking.startDate)).dateStr + " - " + getDayAndDateString(getDateFromSimpleFormat(Booking.newBooking.endDate)).dateStr
        }
        
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionCofirmBooking(_ sender: Any) {
        
        let param = [
            "sale_id": House.selectedHouse?.salesId ?? 0,
            "use_times": [
                "from": Booking.newBooking.startDate,
                "until": Booking.newBooking.endDate
            ]
            ] as [String : Any]
        
        ApiManager.sharedObj.requestApi(API_Bookings, method: .post, param: param) { (responseDict, isSuccess, errorStr) in
            if isSuccess {
                
                House.newHouse = House()
                let congratsVC = AddHouseStoryboard.instantiateViewController(withIdentifier: "CongratulationVC") as! CongratulationVC
                congratsVC.titleString = "Congratulations! your booking of a house successful"
                self.navigationController?.pushViewController(congratsVC, animated: true)
            }else {
                showAlert(title: "B-App", message: errorStr!, controller: self)
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
