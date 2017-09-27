//
//  HouseAreaVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class HouseAreaVC: UIViewController {

    @IBOutlet weak var sliderArea: UISlider!
    @IBOutlet weak var lblSliderValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if House.newHouse.areaSIze == ""
        {
            lblSliderValue.text = "100"
            sliderArea.value = 100
        }else
        {
            lblSliderValue.text = House.newHouse.areaSIze
            sliderArea.value = Float(House.newHouse.areaSIze)!
        }
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        House.newHouse.areaSIze = "\(Int(sliderArea.value))"
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        House.newHouse.areaSIze = "\(Int(sliderArea.value))"
        self.pushViewController(controllerName: "CostTypeSelectVC", storyboardName: AddHouseStoryboard)
    }
    @IBAction func actionSlider(_ sender: Any) {
        lblSliderValue.text = "\(Int(sliderArea.value))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
