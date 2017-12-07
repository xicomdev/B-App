//
//  CostTypeSelectVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class CostTypeSelectVC: UIViewController {
    
    @IBOutlet weak var btnHourly: UIButton!
    @IBOutlet weak var btnDaily: UIButton!
    @IBOutlet weak var btnWeekly: UIButton!
    @IBOutlet weak var btnMonthly: UIButton!
    
    var selectedCostType = "Monthly"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setSelectedCostType(House.newHouse.costType)
    }
    
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        
        House.newHouse.costType = selectedCostType
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        
        House.newHouse.costType = selectedCostType
        self.pushViewController(controllerName: "StartPriceVC", storyboardName: AddHouseStoryboard)
    }
    
    @IBAction func actionHourlyPrice(_ sender: Any) {
        setSelectedCostType("Hourly")
    }
    
    @IBAction func actionDailyPrice(_ sender: Any) {
        setSelectedCostType("Daily")
    }
    @IBAction func actionWeeklyPrice(_ sender: Any) {
        setSelectedCostType("Weekly")
    }
    @IBAction func actionMonlyPrice(_ sender: Any) {
        setSelectedCostType("Monthly")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setSelectedCostType(_ type: String) {
        selectedCostType = type
        
        btnHourly.isSelected = false
        btnDaily.isSelected = false
        btnWeekly.isSelected = false
        btnMonthly.isSelected = false
        
        switch type {
        case "Hourly":
            btnHourly.isSelected = true
        case "Daily":
            btnDaily.isSelected = true
        case "Weekly":
            btnWeekly.isSelected = true
        default:
            btnMonthly.isSelected = true
        }
    }
    
}
