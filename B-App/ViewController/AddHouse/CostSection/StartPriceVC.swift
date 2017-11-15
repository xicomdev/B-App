//
//  StartPriceVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class StartPriceVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var lblSliderValue: UILabel!
    @IBOutlet weak var sliderPrice: UISlider!
    @IBOutlet weak var txtfldCurrency: UITextField!
    
    var picker = UIPickerView()
    var aryCurrency = ["$","€","£"]
    override func viewDidLoad() {
        super.viewDidLoad()

        txtfldCurrency.text = House.newHouse.currency
        picker.delegate = self
        txtfldCurrency.inputView = picker
        if House.newHouse.startPrice == ""
        {
            lblSliderValue.text = "$100"
            sliderPrice.value = 100
            txtfldCurrency.text = "$"

        }else
        {
            lblSliderValue.text = "\(txtfldCurrency.text!)\(House.newHouse.startPrice)"
            sliderPrice.value = Float(House.newHouse.startPrice)!
        }
        
        txtfldCurrency.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated:  true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        House.newHouse.startPrice = "\(txtfldCurrency.text!)\(Int(sliderPrice.value))"
        self.navigationController?.popToRootViewController(animated: true)

    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        House.newHouse.startPrice = "\(txtfldCurrency.text!)\(Int(sliderPrice.value))"
        self.pushViewController(controllerName: "NoticePeriodVC", storyboardName: AddHouseStoryboard)
    }
    @IBAction func actionSliderPrice(_ sender: Any) {
        lblSliderValue.text = "\(txtfldCurrency.text!)\(Int(sliderPrice.value))"
    }

    //MARK: - picker view delegate methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return aryCurrency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return aryCurrency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtfldCurrency.text = aryCurrency[row]
        lblSliderValue.text = "\(txtfldCurrency.text!)\(Int(sliderPrice.value))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
