//
//  AccomodationTypeVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class AccomodationTypeVC: UIViewController,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtfldHouseType: UITextField!
    var pickerview = UIPickerView()
    
    let aryHouseTypes = ["1 BHK", "2 BHK"]
    override func viewDidLoad() {
        super.viewDidLoad()

        txtfldHouseType.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldHouseType.inputView = pickerview
        pickerview.delegate = self
        pickerview.dataSource = self
        
        txtfldHouseType.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtfldHouseType.text = House.newHouse.accomodationType
    }
    
    //MARK: - Textfield delegate method
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if txtfldHouseType.isBlank() {
            txtfldHouseType.text = aryHouseTypes[0]
        }
    }

    //MARK: - Buttons Actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        House.newHouse.accomodationType = txtfldHouseType.text!
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        if txtfldHouseType.isBlank() {
            showAlert(title: "B-App", message: "Please select accomodation type", controller: self)
        }else {
            House.newHouse.accomodationType = txtfldHouseType.text!
            self.pushViewController(controllerName: "HouseLocationVC", storyboardName: AddHouseStoryboard)
        }
    }
    
    //MARK: - Picker view Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return aryHouseTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return aryHouseTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtfldHouseType.text = aryHouseTypes[row]
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
