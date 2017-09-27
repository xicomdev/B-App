//
//  CostTypeSelectVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class CostTypeSelectVC: UIViewController {

    @IBOutlet weak var btnDemandPrice: UIButton!
    @IBOutlet weak var btnFixedPrice: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        House.newHouse.costType = "Demand Price"
        btnDemandPrice.isSelected = true
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        if btnDemandPrice.isSelected {
            House.newHouse.costType = "Demand Price"
        }else {
            House.newHouse.costType = "Fixed Price"
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        if btnDemandPrice.isSelected {
            House.newHouse.costType = "Demand Price"
        }else {
            House.newHouse.costType = "Fixed Price"
        }
        self.pushViewController(controllerName: "StartPriceVC", storyboardName: AddHouseStoryboard)
    }
    @IBAction func actionDemandPrice(_ sender: Any) {
        btnDemandPrice.isSelected = true
        btnFixedPrice.isSelected = false
    }
    @IBAction func actionFixedPrice(_ sender: Any) {
        btnDemandPrice.isSelected = false
        btnFixedPrice.isSelected = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
