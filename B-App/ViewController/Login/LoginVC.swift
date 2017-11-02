//
//  LoginVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var txtfldPassword: HoshiTextField!
    @IBOutlet weak var txtfldEmail: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
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
    @IBAction func actionLoginBtn(_ sender: AnyObject) {
        if !(txtfldEmail.text!.isValidEmail()) {
            showAlert(title: "B-App", message: "Please enter valid email", controller: self)
        }else if txtfldPassword.text!.isEmpty {
            showAlert(title: "B-App", message: "Please enter password", controller: self)
        }else
        {
            User.me.email = txtfldEmail.text!
            User.me.password = txtfldPassword.text!
            
            ApiManager.sharedObj.requestApi(API_Login, method: .post, param: nil, completion: { (resultDict, isSuccess, strError) in
                if isSuccess {
                    User.setUserMe(resultDict!)
                    self.pushViewController(controllerName: "SignupStep6VC", storyboardName: mainStoryboard)
                }else {
                    showAlert(title: "B-App", message: strError!, controller: self)
                }
            })
        
        }
    }
    
    @IBAction func actionForgotPasswordBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "ForgotPasswordVC", storyboardName: mainStoryboard)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
