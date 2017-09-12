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

    @IBOutlet weak var btnTerm: UIButton!
    @IBOutlet weak var btnGender: UIButton!
    @IBOutlet weak var lblSizeValue: UILabel!
    @IBOutlet weak var txtfldRegion: UITextField!
    @IBOutlet weak var priceRangeSlider: RangeSlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - Buttons actions

    @IBAction func actionSIzeMinus(_ sender: AnyObject) {
    }
    @IBAction func actionBackBtn(_ sender: AnyObject) {
    }
    @IBAction func actionResetBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSizePlus(_ sender: AnyObject) {
    }
    @IBAction func actionGenderBtn(_ sender: AnyObject) {
    }
    @IBAction func actionTermBtn(_ sender: AnyObject) {
    }
    @IBAction func actionApplyBtn(_ sender: AnyObject) {
    }
    @IBAction func actionPriceChanged(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
