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
    }
    @IBAction func actionResetBtn(_ sender: AnyObject) {
    }
    @IBAction func actionRadioPending(_ sender: AnyObject) {
    }
    @IBAction func actionRadioPrice(_ sender: AnyObject) {
    }
    @IBAction func actionRadioPlaceNearFar(_ sender: AnyObject) {
    }
    @IBAction func actionRadioPlaceFarNear(_ sender: AnyObject) {
    }
    @IBAction func actionApplyBtn(_ sender: AnyObject) {
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
