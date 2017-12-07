//
//  BeforeBookOptionsVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class BeforeBookOptionsVC: UIViewController {

    @IBOutlet weak var imgIdConfirm: UIImageView!
    @IBOutlet weak var imgContactDetails: UIImageView!
    @IBOutlet weak var imgAddPhoto: UIImageView!
    @IBOutlet weak var imgCreateAccnt: UIImageView!
    var houseInfo = House()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        self.pushViewController(controllerName: "BookingPhoneNoVC", storyboardName: bookingStoryboard)
    }
    
    @IBAction func actionCreateAccount(_ sender: Any) {
    }
    
    @IBAction func actionAddPhoto(_ sender: Any) {
    }
    
    @IBAction func actionContactDetail(_ sender: Any) {
    }
    
    @IBAction func actionIdConfirmation(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
