//
//  PasswordVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class PasswordVC: UIViewController {

    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var txtfldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionEyeBtn(_ sender: Any) {
        if btnEye.isSelected {
            btnEye.isSelected = false
            txtfldPassword.isSecureTextEntry = true
        }else {
            btnEye.isSelected = true
            txtfldPassword.isSecureTextEntry = false
        }
        
    }
    @IBAction func actionNextBtn(_ sender: Any) {
        if txtfldPassword.text!.isEmpty {
            showAlert(title: "B-App", message: "Please enter password", controller: self)
            
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
