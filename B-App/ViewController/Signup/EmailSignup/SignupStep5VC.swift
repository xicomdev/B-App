//
//  SignupStep5VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SignupStep5VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionAcceptBtn(_ sender: AnyObject) {
        let param = [
            "first_name": User.me.firstname ,
            "last_name": User.me.lastname,
            "email": User.me.email,
            "password": User.me.password
        ]
        
        ApiManager.sharedObj.requestApi(API_Signup, method: .post, param: param) { (responseDict, isSuccess, errorStr) in
            if isSuccess {
                showAlert(title: "Signup Successfull", message: "You may now login.", controller: self)
                self.navigationController?.popToRootViewController(animated: true)
            }else {
                showAlert(title: "B-App", message: errorStr!, controller: self)
            }
        }
    }
    @IBAction func actionDeclineBtn(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }
