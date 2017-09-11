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

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBackBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
