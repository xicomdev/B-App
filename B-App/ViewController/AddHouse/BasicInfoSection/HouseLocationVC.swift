//
//  HouseLocationVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class HouseLocationVC: UIViewController {

    @IBOutlet weak var txtfldZipcode: UITextField!
    @IBOutlet weak var txtfldApartmentNo: UITextField!
    @IBOutlet weak var txtfldStreet: UITextField!
    @IBOutlet weak var txtfldCity: UITextField!
    @IBOutlet weak var txtfldCountry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfldCountry.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldCity.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldStreet.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldApartmentNo.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)
        txtfldZipcode.setBorder(corners: 5, borderWidth: 1, borderColor: UIColor.gray)

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        let tabBarController = tabbarStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        appDelegate().window?.rootViewController = tabBarController
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        self.pushViewController(controllerName: "HouseLocationMapVC", storyboardName: AddHouseStoryboard)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
