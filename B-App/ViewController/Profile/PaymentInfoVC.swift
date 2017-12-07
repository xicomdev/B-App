//
//  PaymentInfoVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class PaymentInfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblCards: UITableView!
    
    var aryCards = ["5544664466554524","5544664466552485"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tblCards.registerNibsForCells(arryNib: ["FaqTableCell"])
        tblCards.delegate = self
        tblCards.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionAddCard(_ sender: Any) {
        let addCardVc = profileStoryboard.instantiateViewController(withIdentifier: "AddNewCardVC") as! AddNewCardVC
        addCardVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addCardVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryCards.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tblCards.estimatedRowHeight = 70
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblCards.dequeueReusableCell(withIdentifier: "FaqTableCell", for: indexPath) as! FaqTableCell
        cell.lblTitle.text = (aryCards[indexPath.row] as NSString).replacingCharacters(in: NSMakeRange(0, 12), with: "************")
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
