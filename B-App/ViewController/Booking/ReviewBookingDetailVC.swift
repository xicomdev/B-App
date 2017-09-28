//
//  ReviewBookingDetailVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

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

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionCofirmBooking(_ sender: Any) {
        let congratsVC = AddHouseStoryboard.instantiateViewController(withIdentifier: "CongratulationVC") as! CongratulationVC
        congratsVC.lblText.text = "Congratulations! your booking of a house successful"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
