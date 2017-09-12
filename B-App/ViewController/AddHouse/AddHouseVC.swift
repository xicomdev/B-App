//
//  AddHouseVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class AddHouseVC: UIViewController {

    @IBOutlet weak var btnPreview: UIButton!
    @IBOutlet weak var lblCostContent: UILabel!
    @IBOutlet weak var lblCostTitle: UILabel!
    @IBOutlet weak var lblPhotosContent: UILabel!
    @IBOutlet weak var lblPhotosTitle: UILabel!
    @IBOutlet weak var lblBasicInfoContent: UILabel!
    @IBOutlet weak var lblBasicInfoTitle: UILabel!
    @IBOutlet weak var btnSaveExit: UIButton!
    @IBOutlet weak var btnCostTick: SetCornerButton!
    @IBOutlet weak var btnPhotosTick: SetCornerButton!
    @IBOutlet weak var btnBasicInfoTick: SetCornerButton!
    @IBOutlet weak var btnCostContinue: UIButton!
    @IBOutlet weak var btnPhotosContinue: UIButton!
    @IBOutlet weak var btnBasicInfoContinue: UIButton!
    @IBOutlet weak var btnBasicInfoNext: UIButton!
    @IBOutlet weak var btnPhotosNext: UIButton!
    @IBOutlet weak var btnCostNext: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Buttons Actions

    @IBAction func actionCrossBtn(_ sender: AnyObject) {
    }
    @IBAction func actionBasicContinue(_ sender: AnyObject) {
    }
    @IBAction func actionPhotosContinue(_ sender: AnyObject) {
    }
    @IBAction func actionCostContinue(_ sender: AnyObject) {
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
    }
    @IBAction func actionPhotosNext(_ sender: AnyObject) {
    }
    
    @IBAction func actionBasicInfoNext(_ sender: AnyObject) {
    }
    @IBAction func actionCostNext(_ sender: AnyObject) {
    }
    @IBAction func actionPreviewBtn(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
