//
//  SignupStep1VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import TextFieldEffects

class SignupStep1VC: UIViewController {

    @IBOutlet weak var txtfldName: HoshiTextField!
    @IBOutlet weak var txtfldSurname: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    @IBAction func actionNextBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "SignupStep2VC", storyboardName: mainStoryboard)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
