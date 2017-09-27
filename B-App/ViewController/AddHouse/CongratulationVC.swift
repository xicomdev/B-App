//
//  CongratulationVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/27/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class CongratulationVC: UIViewController {

    @IBOutlet var lblText: UILabel!
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerRunning), userInfo: nil, repeats: false)
    }
    
    func timerRunning() {
        let tabBarController = tabbarStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        tabBarController.selectedIndex = 0
        appDelegate().window?.rootViewController = tabBarController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
