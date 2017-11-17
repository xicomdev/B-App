//
//  HouseLocationVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class HouseLocationVC: UIViewController {

    @IBOutlet weak var txtfldZipcode: UITextField!
    @IBOutlet weak var txtfldApartmentNo: UITextField!
    @IBOutlet weak var txtfldStreet: UITextField!
    @IBOutlet weak var txtfldCity: UITextField!
    @IBOutlet weak var txtfldCountry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfldCountry.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldCity.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldStreet.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldApartmentNo.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldZipcode.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        txtfldCountry.text = House.newHouse.country
        txtfldCity.text = House.newHouse.city
        txtfldStreet.text = House.newHouse.street
        txtfldApartmentNo.text = House.newHouse.apartmentNo
        txtfldZipcode.text = House.newHouse.zipcode
    }
    
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        
            House.newHouse.country = txtfldCountry.text!
            House.newHouse.city = txtfldCity.text!
            House.newHouse.street = txtfldStreet.text!
            House.newHouse.apartmentNo = txtfldApartmentNo.text!
            House.newHouse.zipcode = txtfldZipcode.text!
            self.navigationController?.popToRootViewController(animated: true)
        
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        if txtfldCountry.isBlank() {
            showAlert(title: "B-App", message: "Please enter country", controller: self)
        }else if txtfldCity.isBlank() {
            showAlert(title: "B-App", message: "Please enter city", controller: self)
        }else if txtfldStreet.isBlank() {
            showAlert(title: "B-App", message: "Please enter street", controller: self)
        }else if txtfldApartmentNo.isBlank() {
            showAlert(title: "B-App", message: "Please enter apartment number", controller: self)
        }else if txtfldZipcode.isBlank() {
            showAlert(title: "B-App", message: "Please enter zip code", controller: self)
        }else {
            House.newHouse.country = txtfldCountry.text!
            House.newHouse.city = txtfldCity.text!
            House.newHouse.street = txtfldStreet.text!
            House.newHouse.apartmentNo = txtfldApartmentNo.text!
            House.newHouse.zipcode = txtfldZipcode.text!
            House.newHouse.address = "\(txtfldApartmentNo.text!) \(txtfldStreet.text!) \(txtfldCity.text!) \(txtfldCountry.text!) \(txtfldZipcode.text!)"
            self.pushViewController(controllerName: "HouseLocationMapVC", storyboardName: AddHouseStoryboard)

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
