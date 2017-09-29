//
//  BookingEmailConfirmVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class BookingEmailConfirmVC: UIViewController {
    @IBOutlet weak var txtfldEmail: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSendBtn(_ sender: Any) {
        if !(txtfldEmail.text!.isValidEmail()) {
            showAlert(title: "B-App", message: "Please enter valid email", controller: self)
        }else {
            self.pushViewController(controllerName: "EmailSendAgainVC", storyboardName: bookingStoryboard)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
