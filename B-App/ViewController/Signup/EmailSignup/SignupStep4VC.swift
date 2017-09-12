//
//  SignupStep4VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SignupStep4VC: UIViewController {

    @IBOutlet weak var imgVW: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    @IBAction func actionIAgreeBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "SignupStep5VC", storyboardName: mainStoryboard)
    }
    @IBAction func actionSkipBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "SignupStep5VC", storyboardName: mainStoryboard)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
