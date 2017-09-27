//
//  CalenderVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import FSCalendar

class CalenderVC: UIViewController {

    @IBOutlet weak var calenderVw: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calenderVw.allowsMultipleSelection = true
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        print(calenderVw.selectedDates)
        self.pushViewController(controllerName: "ConfirmAgreementVC", storyboardName: AddHouseStoryboard)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
