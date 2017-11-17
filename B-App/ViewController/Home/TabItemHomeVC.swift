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
    @IBOutlet weak var lblNoPost: UILabel!
    
    var aryMyAds = [House]()
    
    var selectedTab = "my ads"
    override func viewDidLoad() {
        super.viewDidLoad()

        tblVwAds.registerNibsForCells(arryNib: ["MyAdsTVCell"])
        tblVwAds.delegate = self
        tblVwAds.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        selectedTab = "my ads"
        getMyAds()
    }
    
    //MARK: - Buttons Actions
    @IBAction func actionNewAdBtn(_ sender: AnyObject) {
        let addHouseVc = AddHouseStoryboard.instantiateViewController(withIdentifier: "AddHouseVC") as! AddHouseVC
        let navControllr = UINavigationController.init(rootViewController: addHouseVc)
        appDelegate().window?.rootViewController = navControllr
    }
    
    @IBAction func actionMyAdsBtn(_ sender: AnyObject) {
        selectedTab = "my ads"
        btnDesiredAds.setTitleColor(UIColor.lightGray, for: .normal)
        btnMyAds.setTitleColor(UIColor.black, for: .normal)
        getMyAds()
    }
    @IBAction func actionDesiredAdsBtn(_ sender: AnyObject) {
        selectedTab = "desired ads"
        btnMyAds.setTitleColor(UIColor.lightGray, for: .normal)
        btnDesiredAds.setTitleColor(UIColor.black, for: .normal)
        tblVwAds.isHidden = false
        tblVwAds.reloadData()
    }
    
    //MARK: - TableView delegate and datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedTab == "my ads" {
            return aryMyAds.count
        }else  {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwAds.dequeueReusableCell(withIdentifier: "MyAdsTVCell") as! MyAdsTVCell
        cell.showMyAd(aryMyAds[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func getMyAds() {
        
        ApiManager.sharedObj.requestApi(API_MyBillboards, method: .get, param: nil) { (responseDict, isSuccess, errorStr) in
            if isSuccess {
                self.tblVwAds.isHidden = false
                self.aryMyAds = House.getMyAds(responseDict!["billboards"] as! NSArray)
                self.tblVwAds.reloadData()
            }else {
                showAlert(title: "B-App", message: errorStr!, controller: self)
                self.tblVwAds.isHidden = true
            }
            self.tblVwAds.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
