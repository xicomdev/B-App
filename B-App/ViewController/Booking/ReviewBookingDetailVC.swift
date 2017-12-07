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
//            imgVw.kf.setImage(with: URL(string: (House.selectedHouse?.aryImgUrls[0])!))
        }
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionCofirmBooking(_ sender: Any) {
        let congratsVC = AddHouseStoryboard.instantiateViewController(withIdentifier: "CongratulationVC") as! CongratulationVC
        congratsVC.titleString = "Congratulations! your booking of a house successful"
        self.navigationController?.pushViewController(congratsVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
