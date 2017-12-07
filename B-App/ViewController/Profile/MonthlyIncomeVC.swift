//
//  MonthlyIncomeVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 07/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class MonthlyIncomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblVw.delegate = self
        tblVw.dataSource = self
        tblVw.registerNibsForCells(arryNib: ["MonthlyIncomeCell"])
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Tableview Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVw.dequeueReusableCell(withIdentifier: "MonthlyIncomeCell") as! MonthlyIncomeCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
