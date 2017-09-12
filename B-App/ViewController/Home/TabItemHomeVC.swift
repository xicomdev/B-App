//
//  TabItemHomeVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class TabItemHomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tblVwAds: UITableView!
    @IBOutlet weak var btnDesiredAds: UIButton!
    @IBOutlet weak var btnMyAds: UIButton!
    @IBOutlet weak var btnNewAd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblVwAds.registerNibsForCells(arryNib: ["MyAdsTVCell"])
        tblVwAds.delegate = self
        tblVwAds.dataSource = self
    }

    //MARK: - Buttons Actions
    @IBAction func actionNewAdBtn(_ sender: AnyObject) {
    }
    @IBAction func actionMyAdsBtn(_ sender: AnyObject) {
    }
    @IBAction func actionDesiredAdsBtn(_ sender: AnyObject) {
    }
    
    //MARK: - TableView delegate and datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwAds.dequeueReusableCell(withIdentifier: "MyAdsTVCell") as! MyAdsTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
