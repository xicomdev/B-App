//
//  SortByVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SortByVC: UIViewController {

    @IBOutlet weak var radioBtnPlaceFarNear: UIButton!
    @IBOutlet weak var radioBtnPlaceNearFar: UIButton!
    @IBOutlet weak var radioBtnPrice: UIButton!
    @IBOutlet weak var radioBtnPending: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - Buttons actions

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionResetBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionRadioPending(_ sender: AnyObject) {
        radioBtnPending.isSelected = true
        radioBtnPrice.isSelected = false
        radioBtnPlaceNearFar.isSelected = false
        radioBtnPlaceFarNear.isSelected = false
    }
    
    @IBAction func actionRadioPrice(_ sender: AnyObject) {
        radioBtnPending.isSelected = false
        radioBtnPrice.isSelected = true
        radioBtnPlaceNearFar.isSelected = false
        radioBtnPlaceFarNear.isSelected = false
    }
    
    @IBAction func actionRadioPlaceNearFar(_ sender: AnyObject) {
        radioBtnPending.isSelected = false
        radioBtnPrice.isSelected = false
        radioBtnPlaceNearFar.isSelected = true
        radioBtnPlaceFarNear.isSelected = false
    }
    
    @IBAction func actionRadioPlaceFarNear(_ sender: AnyObject) {
        radioBtnPending.isSelected = false
        radioBtnPrice.isSelected = false
        radioBtnPlaceNearFar.isSelected = false
        radioBtnPlaceFarNear.isSelected = true
    }
    
    @IBAction func actionApplyBtn(_ sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
