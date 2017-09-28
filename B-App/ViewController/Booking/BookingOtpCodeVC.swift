//
//  BookingOtpCodeVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class BookingOtpCodeVC: UIViewController {

    @IBOutlet weak var txtfldCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "BookingEmailConfirmVC", storyboardName: bookingStoryboard)
        
    }
    @IBAction func actionSendAgain(_ sender: Any) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
