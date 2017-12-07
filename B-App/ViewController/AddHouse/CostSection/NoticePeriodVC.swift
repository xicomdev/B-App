//
//  NoticePeriodVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class NoticePeriodVC: UIViewController {

    @IBOutlet weak var txtfldTime: UITextField!
    @IBOutlet weak var btnNotifications: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtfldTime.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        txtfldTime.text = House.newHouse.noticePeriod
        btnNotifications.isSelected = House.newHouse.isNoificationOn
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        House.newHouse.isNoificationOn = btnNotifications.isSelected
        House.newHouse.noticePeriod = txtfldTime.text!
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        if txtfldTime.isBlank() {
            showAlert(title: "B-App", message: "Please enter time", controller: self)
        }
        House.newHouse.isNoificationOn = btnNotifications.isSelected
        House.newHouse.noticePeriod = txtfldTime.text!
        self.pushViewController(controllerName: "CalenderVC", storyboardName: AddHouseStoryboard)
    }
    
    @IBAction func actionNotification(_ sender: Any) {
        btnNotifications.isSelected = !btnNotifications.isSelected
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
