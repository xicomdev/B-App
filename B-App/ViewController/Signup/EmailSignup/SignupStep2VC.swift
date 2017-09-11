//
//  SignupStep2VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import TextFieldEffects

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
    }
    @IBAction func actionNextBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "SignupStep3VC", storyboardName: mainStoryboard)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
