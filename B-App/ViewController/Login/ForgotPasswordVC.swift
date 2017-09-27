//
//  ForgotPasswordVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var txtfldEmail: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSubmitBtn(_ sender: AnyObject) {
        if !(txtfldEmail.text!.isValidEmail()) {
            showAlert(title: "B-App", message: "Please enter valid email", controller: self)
        }else {
            showAlert(title: "Check your mail", message: "We sent you an email to \(txtfldEmail.text!). Click on the link in the email to reset your password.", controller: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
