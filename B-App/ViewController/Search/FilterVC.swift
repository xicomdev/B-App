//
//  FilterVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import SwiftRangeSlider

class FilterVC: UIViewController {

    @IBOutlet weak var lblPriceRange: UILabel!
    @IBOutlet weak var btnTerm: UIButton!
    @IBOutlet weak var btnGender: UIButton!
    @IBOutlet weak var lblSizeValue: UILabel!
    @IBOutlet weak var txtfldRegion: UITextField!
    @IBOutlet weak var priceRangeSlider: RangeSlider!
    
    var currentSize = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hidesBottomBarWhenPushed = true
    }

    //MARK: - Buttons actions

    
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionResetBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionSIzeMinus(_ sender: AnyObject) {
        if currentSize != 0 {
            lblSizeValue.text = "\(currentSize - 1)"
        }
    }
    
    @IBAction func actionSizePlus(_ sender: AnyObject) {
        lblSizeValue.text = "\(currentSize + 1)"
    }
    
    @IBAction func actionGenderBtn(_ sender: AnyObject) {
        if btnGender.isSelected {
            btnGender.isSelected = false
        }else {
            btnGender.isSelected = true
        }
    }
    
    @IBAction func actionTermBtn(_ sender: AnyObject) {
        if btnTerm.isSelected {
            btnTerm.isSelected = false
        }else {
            btnTerm.isSelected = true
        }
    }
    
    @IBAction func actionApplyBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionPriceChanged(_ sender: AnyObject) {
        lblPriceRange.text = "$\(priceRangeSlider.lowerValue)-$\(priceRangeSlider.upperValue)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
