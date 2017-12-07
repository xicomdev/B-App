//
//  SignupStep1VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SignupStep1VC: UIViewController {

    @IBOutlet weak var txtfldName: HoshiTextField!
    @IBOutlet weak var txtfldSurname: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionNextBtn(_ sender: AnyObject) {
        if txtfldName.isBlank() {
            txtfldName.text = ""
            showAlert(title: "B-App", message: "Please enter name", controller: self)
        }else if txtfldSurname.isBlank() {
            txtfldSurname.text = ""
            showAlert(title: "B-App", message: "Please enter surname", controller: self)
        }else {
            User.me.firstname = txtfldName.text!
            User.me.lastname = txtfldSurname.text!
            self.pushViewController(controllerName: "SignupStep2VC", storyboardName: mainStoryboard)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
