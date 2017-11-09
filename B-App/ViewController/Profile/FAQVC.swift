//
//  FAQVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class FAQVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblScreenTitle: UILabel!
    @IBOutlet weak var tblFaq: UITableView!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    var screenTitle = ""
    var aryFaq = ["Payment Methods", "Cancellation", "Transactions", "Terms of use", "Profile confirmation"]
    override func viewDidLoad() {
        super.viewDidLoad()

        lblScreenTitle.text = screenTitle
        if screenTitle == "" {
            lblSubtitle.text = ""
        }
        tblFaq.registerNibsForCells(arryNib: ["FaqTableCell"])
        tblFaq.delegate = self
        tblFaq.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return aryFaq.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tblFaq.estimatedRowHeight = 70
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFaq.dequeueReusableCell(withIdentifier: "FaqTableCell", for: indexPath) as! FaqTableCell
        cell.lblTitle.text = aryFaq[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if screenTitle == "FAQ" {
            let faqvc = profileStoryboard.instantiateViewController(withIdentifier: "FAQVC") as! FAQVC
            faqvc.screenTitle = ""
            self.navigationController?.pushViewController(faqvc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
