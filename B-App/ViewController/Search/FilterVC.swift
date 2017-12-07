//
//  FilterVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import SwiftRangeSlider

struct FilterInfo {
    var filterEnabled = false
    var region = String()
    var priceRangeStart = Int()
    var priceRangeEnd = Int()
    var size = Int()
    var gender = false
    var term = false
    
}

var filterDetails : FilterInfo = FilterInfo()


class FilterVC: UIViewController {

    @IBOutlet weak var lblPriceRange: UILabel!
    @IBOutlet weak var btnTerm: UIButton!
    @IBOutlet weak var btnGender: UIButton!
    @IBOutlet weak var lblSizeValue: UILabel!
    @IBOutlet weak var txtfldRegion: UITextField!
    @IBOutlet weak var priceRangeSlider: RangeSlider!
    
    var currentSize = 0
    
    var selectionDelegate: MSSelectionCallback!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hidesBottomBarWhenPushed = true
        lblSizeValue.text = "0"
        lblPriceRange.text = "$\(Int(priceRangeSlider.lowerValue))-$\(Int(priceRangeSlider.upperValue))"
        if filterDetails.filterEnabled {
            txtfldRegion.text = filterDetails.region
            priceRangeSlider.lowerValue = Double(filterDetails.priceRangeStart)
            priceRangeSlider.upperValue = Double(filterDetails.priceRangeEnd)
            lblPriceRange.text = "$\(filterDetails.priceRangeStart)-$\(filterDetails.priceRangeEnd)"
            lblSizeValue.text = "\(filterDetails.size)"
            btnGender.isSelected = filterDetails.gender
            btnTerm.isSelected = filterDetails.term
        }
    }

    //MARK: - Buttons actions

    
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionResetBtn(_ sender: AnyObject) {
        filterDetails.filterEnabled = false
    }
    
    @IBAction func actionSIzeMinus(_ sender: AnyObject) {
        if currentSize != 0 {
            currentSize -= 1
            lblSizeValue.text = "\(currentSize)"
        }
    }
    
    @IBAction func actionSizePlus(_ sender: AnyObject) {
        currentSize += 1
        lblSizeValue.text = "\(currentSize)"
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
        filterDetails.filterEnabled = true
        filterDetails.gender = btnGender.isSelected
        filterDetails.term = btnTerm.isSelected
        filterDetails.size = currentSize
        filterDetails.priceRangeStart = Int(priceRangeSlider.lowerValue)
        filterDetails.priceRangeEnd = Int(priceRangeSlider.upperValue)
        if selectionDelegate != nil {
            selectionDelegate.moveWithFilterSelection!()
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func actionPriceChanged(_ sender: AnyObject) {
        lblPriceRange.text = "$\(Int(priceRangeSlider.lowerValue))-$\(Int(priceRangeSlider.upperValue))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
