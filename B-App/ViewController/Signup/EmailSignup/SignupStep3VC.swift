//
//  SignupStep3VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SignupStep3VC: UIViewController {

    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var txtfldPassword: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Buttons Actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }

    @IBAction func actionEyeBtn(_ sender: AnyObject) {
        if btnEye.isSelected {
            btnEye.isSelected = false
            txtfldPassword.isSecureTextEntry = true
        }else {
            btnEye.isSelected = true
            txtfldPassword.isSecureTextEntry = false
        }
    }
    
    @IBAction func actionNextBtn(_ sender: AnyObject) {
        User.me.password = txtfldPassword.text!
        self.pushViewController(controllerName: "SignupStep4VC", storyboardName: mainStoryboard)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
