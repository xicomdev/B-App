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
        let addHouseVc = AddHouseStoryboard.instantiateViewController(withIdentifier: "AddHouseVC") as! AddHouseVC
        let navControllr = UINavigationController.init(rootViewController: addHouseVc)
        appDelegate().window?.rootViewController = navControllr
    }
    
    @IBAction func actionMyAdsBtn(_ sender: AnyObject) {
        btnDesiredAds.setTitleColor(UIColor(red: 71/255, green: 16/49/255, blue: 207/255, alpha: 1), for: .normal)
        btnMyAds.setTitleColor(UIColor.white, for: .normal)
    }
    @IBAction func actionDesiredAdsBtn(_ sender: AnyObject) {
        btnDesiredAds.setTitleColor(UIColor(red: 71/255, green: 16/49/255, blue: 207/255, alpha: 1), for: .normal)
        btnMyAds.setTitleColor(UIColor.white, for: .normal)
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
