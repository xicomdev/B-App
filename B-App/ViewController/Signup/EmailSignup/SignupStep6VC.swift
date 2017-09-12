//
//  SignupStep6VC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SignupStep6VC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var hgtConstBackBtn: NSLayoutConstraint!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnSelection: UIButton!
    @IBOutlet weak var imgvw2: UIImageView!
    @IBOutlet weak var imgvw1: UIImageView!
    @IBOutlet weak var scrollvwImages: UIScrollView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    var screenType = "interest"
    var aryScreenDetails = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var detailDict = [String:Any]()
        if screenType == "interest" {
            detailDict = InterestDetails
//            hgtConstBackBtn.constant = 0
//            btnBack.isHidden = true
        }else if screenType == "ad" {
            detailDict = advertiseDetails
        }else if screenType == "search" {
            detailDict = SearchDetails
        }
        
        lblTitle.text = detailDict["title"] as? String
        aryScreenDetails = detailDict["detail"] as! [[String:Any]]
        
        lblSubtitle.text = aryScreenDetails[0]["subtitle"] as? String
        lblContent.text = aryScreenDetails[0]["content"] as? String
        btnSelection.setTitle(aryScreenDetails[0]["button"] as? String, for: .normal)
    }
    
    //MARK:- ScrolViewDelegates
    //MARK:-
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
        lblSubtitle.text = aryScreenDetails[pageControl.currentPage]["subtitle"] as? String
        lblContent.text = aryScreenDetails[pageControl.currentPage]["content"] as? String
        btnSelection.setTitle(aryScreenDetails[pageControl.currentPage]["button"] as? String, for: .normal)
        
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func actionSelectionBtn(_ sender: AnyObject) {
        if screenType == "interest" {
            if pageControl.currentPage == 0 {
                let adVc = mainStoryboard.instantiateViewController(withIdentifier: "SignupStep6VC") as! SignupStep6VC
                adVc.screenType = "ad"
                self.navigationController?.pushViewController(adVc, animated: true)
            }else {
                let adVc = mainStoryboard.instantiateViewController(withIdentifier: "SignupStep6VC") as! SignupStep6VC
                adVc.screenType = "search"
                self.navigationController?.pushViewController(adVc, animated: true)
            }
        }else if screenType == "ad" {
            self.pushViewController(controllerName: "AddHouseVC", storyboardName: AddHouseStoryboard)
            
        }else if screenType == "search" {
            let tabBarController = tabbarStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
            tabBarController.selectedIndex = 1
            appDelegate().window?.rootViewController = tabBarController
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
