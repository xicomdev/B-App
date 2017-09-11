//
//  TabItemMessageVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class TabItemMessageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblVwMsgList: UITableView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblVwMsgList.registerNibsForCells(arryNib: ["MsgListTVCell"])
        tblVwMsgList.delegate = self
        tblVwMsgList.dataSource = self
        tblVwMsgList.reloadData()
    }

    //MARK: - Buttons Actions
    
    @IBAction func actionEditBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSearchBtn(_ sender: AnyObject) {
    }
    
    //MARK: - Tabkeview deleghate methods and datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwMsgList.dequeueReusableCell(withIdentifier: "MsgListTVCell") as! MsgListTVCell
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
