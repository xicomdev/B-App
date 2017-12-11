//
//  SelectPaymentMethodVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SelectPaymentMethodVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblPayments: UITableView!
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        tblPayments.registerNibsForCells(arryNib: ["PaymentCardCell"])
        tblPayments.delegate = self
        tblPayments.dataSource = self
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionContinue(_ sender: Any) {
        self.pushViewController(controllerName: "ReviewBookingDetailVC", storyboardName: bookingStoryboard)
    }
    
    @IBAction func actionNewCard(_ sender: Any) {
        let addCardVc = profileStoryboard.instantiateViewController(withIdentifier: "AddNewCardVC") as! AddNewCardVC
        addCardVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addCardVc, animated: true)
    }
    
    //MARK: - Table Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblPayments.dequeueReusableCell(withIdentifier: "PaymentCardCell", for: indexPath) as! PaymentCardCell
        cell.lblCardNo.text = "**** **** **** 5656"
        if indexPath.row == selectedIndex {
            cell.imgvwRadio.image = #imageLiteral(resourceName: "radiobatton (selected)")
        }else {
            cell.imgvwRadio.image = #imageLiteral(resourceName: "radiobutton")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tblPayments.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
