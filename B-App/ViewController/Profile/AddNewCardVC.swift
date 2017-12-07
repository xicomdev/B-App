//
//  AddNewCardVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class AddNewCardVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblvw: UITableView!
    
    var aryCardTypes = ["Visa", "Master Card", "Payoneer", "Paypal"]
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        tblvw.registerNibsForCells(arryNib: ["PaymentCardCell"])
        tblvw.delegate = self
        tblvw.dataSource = self
    }

    @IBAction func actionBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionNextBtn(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryCardTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "PaymentCardCell", for: indexPath) as! PaymentCardCell
        if indexPath.row == selectedIndex {
            cell.imgvwRadio.image = #imageLiteral(resourceName: "radiobatton (selected)")
        }else {
            cell.imgvwRadio.image = #imageLiteral(resourceName: "radiobutton")
        }
        cell.lblCardNo.text = aryCardTypes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tblvw.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
