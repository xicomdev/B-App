//
//  StatisticsVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 07/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class StatisticsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionPaymentHistory(_ sender: Any) {
        self.pushViewController(controllerName: "PaymentHistoryVC", storyboardName: profileStoryboard)
    }
    @IBAction func actionMonthlyIncome(_ sender: Any) {
        self.pushViewController(controllerName: "MonthlyIncomeVC", storyboardName: profileStoryboard)
    }
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
