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
        self.pushViewController(controllerName: "ProfileVC", storyboardName: profileStoryboard)
    }
    @IBAction func actionFaq(_ sender: AnyObject) {
        let faqvc = profileStoryboard.instantiateViewController(withIdentifier: "FAQVC") as! FAQVC
        faqvc.screenTitle = "FAQ"
        self.navigationController?.pushViewController(faqvc, animated: true)
//        self.pushViewController(controllerName: "FAQVC", storyboardName: profileStoryboard)
    }
    @IBAction func actionPaymentInfo(_ sender: AnyObject) {
        self.pushViewController(controllerName: "PaymentInfoVC", storyboardName: profileStoryboard)

    }
    @IBAction func actionStat(_ sender: AnyObject) {
        self.pushViewController(controllerName: "ProfileVC", storyboardName: profileStoryboard)

    }
    @IBAction func actionExit(_ sender: AnyObject) {

    }
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
