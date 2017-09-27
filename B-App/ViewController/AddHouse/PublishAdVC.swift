
//
//  PublishAdVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/27/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class PublishAdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionPublish(_ sender: Any) {
        self.pushViewController(controllerName: "CongratulationVC", storyboardName: AddHouseStoryboard)
    }
    
    @IBAction func actionMoreDetail(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
