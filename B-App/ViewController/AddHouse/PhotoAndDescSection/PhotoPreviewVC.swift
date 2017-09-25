//
//  AddPhoto2VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class PhotoPreviewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        let tabBarController = tabbarStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        appDelegate().window?.rootViewController = tabBarController
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
