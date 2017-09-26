//
//  AddHouseVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class AddHouseVC: UIViewController {

    @IBOutlet weak var btnPreviewHgt: NSLayoutConstraint!
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
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if House.newHouse.stageCompleted == 0 {
            btnBasicInfoContinue.isHidden = false
            btnBasicInfoNext.isHidden = true
            btnBasicInfoTick.isHidden = true
            btnPhotosContinue.isHidden = true
            btnPhotosNext.isHidden = true
            btnPhotosTick.isHidden = true
            btnCostContinue.isHidden = true
            btnCostNext.isHidden = true
            btnCostTick.isHidden = true
            
            lblPhotosTitle.isEnabled = false
            lblPhotosContent.isEnabled = false
            lblCostTitle.isEnabled = false
            lblCostContent.isEnabled = false
            
            btnPreview.isHidden = true
            btnPreviewHgt.constant = 0
            
        }else if House.newHouse.stageCompleted == 1 {
            btnBasicInfoContinue.isHidden = true
            btnBasicInfoNext.isHidden = false
            btnBasicInfoTick.isHidden = false
            btnPhotosContinue.isHidden = false
            btnPhotosNext.isHidden = true
            btnPhotosTick.isHidden = true
            btnCostContinue.isHidden = true
            btnCostNext.isHidden = true
            btnCostTick.isHidden = true
            
            lblPhotosTitle.isEnabled = true
            lblPhotosContent.isEnabled = true
            lblCostTitle.isEnabled = false
            lblCostContent.isEnabled = false
            btnPreview.isHidden = false
            btnPreviewHgt.constant = 45
            
        }else if House.newHouse.stageCompleted == 2 {
            btnBasicInfoContinue.isHidden = true
            btnBasicInfoNext.isHidden = false
            btnBasicInfoTick.isHidden = false
            btnPhotosContinue.isHidden = true
            btnPhotosNext.isHidden = false
            btnPhotosTick.isHidden = false
            btnCostContinue.isHidden = false
            btnCostNext.isHidden = true
            btnCostTick.isHidden = true
            
            lblPhotosTitle.isEnabled = true
            lblPhotosContent.isEnabled = true
            lblCostTitle.isEnabled = true
            lblCostContent.isEnabled = true
            
            btnPreview.isHidden = false
            btnPreviewHgt.constant = 45
        }
    }
    
    //MARK: - Buttons Actions

    @IBAction func actionCrossBtn(_ sender: AnyObject) {
        let tabBarController = tabbarStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        appDelegate().window?.rootViewController = tabBarController
    }
    
    @IBAction func actionBasicContinue(_ sender: AnyObject) {
        self.pushViewController(controllerName: "AccomodationTypeVC", storyboardName: AddHouseStoryboard)
    }
    @IBAction func actionBasicInfoNext(_ sender: AnyObject) {
        self.pushViewController(controllerName: "AccomodationTypeVC", storyboardName: AddHouseStoryboard)
    }
    
    @IBAction func actionCostContinue(_ sender: AnyObject) {
        self.pushViewController(controllerName: "HouseAreaVC", storyboardName: AddHouseStoryboard)
    }
    @IBAction func actionCostNext(_ sender: AnyObject) {
        self.pushViewController(controllerName: "HouseAreaVC", storyboardName: AddHouseStoryboard)
    }

    @IBAction func actionPhotosContinue(_ sender: AnyObject) {
        self.pushViewController(controllerName: "AddPhotoVC", storyboardName: AddHouseStoryboard)
    }
    @IBAction func actionPhotosNext(_ sender: AnyObject) {
        self.pushViewController(controllerName: "PhotoPreviewVC", storyboardName: AddHouseStoryboard)
    }
    
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionPreviewBtn(_ sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
