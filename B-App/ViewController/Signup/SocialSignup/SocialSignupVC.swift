//
//  SocialSignupVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SocialSignupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func actionFacebookBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionTwitterBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionLinkedinBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionCreateAccountBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "SignupStep1VC", storyboardName: mainStoryboard)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
