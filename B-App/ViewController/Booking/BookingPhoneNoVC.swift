//
//  BookingPhoneNoVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import CountryPicker

class BookingPhoneNoVC: UIViewController, CountryPickerDelegate {
    
    @IBOutlet weak var txtfldCountryCode: UITextField!
    @IBOutlet weak var txtfldPhoneNo: UITextField!
    
    var countryPicker = CountryPicker()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        txtfldCountryCode.inputView = countryPicker
        countryPicker.countryPickerDelegate = self
        
    }
    
    //MARK: - Coutry picker Delegate Method
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        txtfldCountryCode.text = phoneCode
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        if txtfldCountryCode.isBlank() {
            showAlert(title: "B-App", message: "Please select country code", controller: self)
        }else if txtfldPhoneNo.isBlank() {
            showAlert(title: "B-App", message: "Please enter phone number", controller: self)
        }else  {
            
            self.pushViewController(controllerName: "BookingOtpCodeVC", storyboardName: bookingStoryboard)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
