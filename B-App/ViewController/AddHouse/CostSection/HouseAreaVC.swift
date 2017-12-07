//
//  HouseAreaVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class HouseAreaVC: UIViewController {

    @IBOutlet weak var sliderWidth: UISlider!
    @IBOutlet weak var sliderLength: UISlider!
    @IBOutlet weak var lblAreaValue: UILabel!
    @IBOutlet weak var lblWidthValue: UILabel!
    @IBOutlet weak var lblLengthValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lblWidthValue.text = String(House.newHouse.width)
        sliderWidth.value = Float(House.newHouse.width)
        
        lblLengthValue.text = String(House.newHouse.length)
        sliderLength.value = Float(House.newHouse.length)
        
        lblAreaValue.text = "\(sliderLength.value * sliderWidth.value)"
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        saveAreaInfo()
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        saveAreaInfo()
        self.pushViewController(controllerName: "CostTypeSelectVC", storyboardName: AddHouseStoryboard)
    }
    @IBAction func actionWidthSliderDidChange(_ sender: Any) {
        lblWidthValue.text = "\(Int(sliderWidth.value))"
        lblAreaValue.text = "\(Int(sliderWidth.value) * Int(sliderLength.value))"
    }
    @IBAction func actionLengthSliderDidChange(_ sender: Any) {
        lblLengthValue.text = "\(Int(sliderLength.value))"
        lblAreaValue.text = "\(Int(sliderWidth.value) * Int(sliderLength.value))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func saveAreaInfo() {
        House.newHouse.width = Int(sliderWidth.value)
        House.newHouse.length = Int(sliderLength.value)
        House.newHouse.areaSIze = "\(Int(sliderWidth.value) * Int(sliderLength.value))"
    }
    
}
