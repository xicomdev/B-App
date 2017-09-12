//
//  SignupStep2VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SignupStep2VC: UIViewController {

    @IBOutlet weak var txtfldEmail: HoshiTextField!
    @IBOutlet weak var btnCheckbox: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func actionCheckboxBtn(_ sender: AnyObject) {
        if btnCheckbox.isSelected {
            btnCheckbox.isSelected = false
            User.me.emailNotification = false
        }else {
            btnCheckbox.isSelected = true
            User.me.emailNotification = true
        }
    }
    
    @IBAction func actionNextBtn(_ sender: AnyObject) {
        if !(txtfldEmail.text!.isValidEmail()){
            showAlert(title: "B-App", message: "Please enter valid email", controller: self)
        }else {
            User.me.email = txtfldEmail.text!
            self.pushViewController(controllerName: "SignupStep3VC", storyboardName: mainStoryboard)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
