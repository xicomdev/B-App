//
//  TabItemProfileVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class TabItemProfileVC: UIViewController {

    @IBOutlet weak var lblMembershipDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgvwUser: SetCornerImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - Buttons actions
    
    @IBAction func actionPersonalInfo(_ sender: AnyObject) {
    }
    @IBAction func actionFaq(_ sender: AnyObject) {
    }
    @IBAction func actionPaymentInfo(_ sender: AnyObject) {
    }
    @IBAction func actionStat(_ sender: AnyObject) {
    }
    @IBAction func actionExit(_ sender: AnyObject) {
    }
    @IBAction func actionBackBtn(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
