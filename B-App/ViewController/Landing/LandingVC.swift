//
//  LandingVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class LandingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if (User.getMeArchiver() != nil)
        {
            User.me = User.getMeArchiver()!
            let tabBarController = tabbarStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
            tabBarController.selectedIndex = 1
            appDelegate().window?.rootViewController = tabBarController
        }
    }
    @IBAction func actionLoginBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "LoginVC", storyboardName: mainStoryboard)
    }
    @IBAction func actionCreateAccountBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "SignupStep1VC", storyboardName: mainStoryboard)
    }
    @IBAction func actionSocialNetwotkBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "SocialSignupVC", storyboardName: mainStoryboard)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
