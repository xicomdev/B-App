//
//  AddDescVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class AddDescVC: UIViewController {

    @IBOutlet weak var txtVwDesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtVwDesc.placeholderText = "Add a description: tell us about the house, its style and neighbourhood"
        txtVwDesc.text = House.newHouse.desc
        // Do any additional setup after loading the view.
    }

    //MARK: - Buttons actions
    @IBAction func actionPreviewBtn(_ sender: Any) {
    }
    
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        House.newHouse.desc = txtVwDesc.text!
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        if txtVwDesc.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            showAlert(title: "B-App", message: "Please enter description", controller: self)
        }else {
            House.newHouse.desc = txtVwDesc.text!
            self.pushViewController(controllerName: "AddProfilePhotoVC", storyboardName: AddHouseStoryboard)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
