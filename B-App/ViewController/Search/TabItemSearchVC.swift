//
//  TabItemSearchVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class TabItemSearchVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MSSelectionCallback {

    @IBOutlet weak var btnSortBy: UIButton!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var collctnVwAds: UICollectionView!
    @IBOutlet weak var collctnVwRecomendAds: UICollectionView!
    @IBOutlet weak var btnMoreAds: UIButton!
    @IBOutlet weak var btnSearchHouse: UIButton!
    @IBOutlet weak var btnSearchAd: UIButton!
    
    var aryAds = [House]()
    var aryRecommendedAds = [House]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibAd = UINib(nibName: "HouseAdCVCell", bundle: nil)
        collctnVwRecomendAds.register(nibAd, forCellWithReuseIdentifier: "HouseAdCVCell")
        collctnVwAds.register(nibAd, forCellWithReuseIdentifier: "HouseAdCVCell")
        
        collctnVwAds.delegate = self
        collctnVwAds.dataSource = self
        collctnVwRecomendAds.delegate = self
        collctnVwRecomendAds.dataSource = self
        
        getAds()
        filterDetails = FilterInfo()
        sortDetails = SortInfo()
    }
    
    //MARK: - Buttons Actions

    @IBAction func actionMoreAdsBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionSearchAdBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionSearchHouseBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionSortbyBtn(_ sender: AnyObject) {
        let sortVc = tabbarStoryboard.instantiateViewController(withIdentifier: "SortByVC") as! SortByVC
        sortVc.hidesBottomBarWhenPushed = true
        sortVc.selectionDelegate = self
        self.navigationController?.pushViewController(sortVc, animated: true)
    }
    
    @IBAction func actionFIlterBtn(_ sender: AnyObject) {
        let filterVc = tabbarStoryboard.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        filterVc.hidesBottomBarWhenPushed = true
        filterVc.selectionDelegate = self
        self.navigationController?.pushViewController(filterVc, animated: true)
    }
    
    //MARK: - Delegate functions
    func moveWithFilterSelection() {
        getFilteredAds()
    }
    
    func moveWithSortSelection() {
        getFilteredAds()
    }
    
    //MARK:- CollectionView delegate and datasource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collctnVwAds {
            return aryAds.count
        }else {
            return aryRecommendedAds.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HouseAdCVCell", for: indexPath) as! HouseAdCVCell
        if collectionView == collctnVwAds {
            cell.showData(aryAds[indexPath.row])
        }else {
            cell.showData(aryRecommendedAds[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collctnVwRecomendAds {
            return CGSize(width: collctnVwRecomendAds.frame.width * 3 / 5, height: collctnVwRecomendAds.frame.height)
        }else {
            return CGSize(width: (collctnVwAds.frame.width - 60)/2, height: collctnVwAds.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVc = bookingStoryboard.instantiateViewController(withIdentifier: "BookingAdDetailVC") as! BookingAdDetailVC
        if collectionView == collctnVwAds {
            House.selectedHouse  = aryAds[indexPath.row]
        }else {
            House.selectedHouse  = aryRecommendedAds[indexPath.row]
        }
        detailVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
    
    //MARK: - Api Hit
    func getAds() {
        
        ApiManager.sharedObj.requestApi(API_MyBillboards, method: .get, param: nil) { (responseDict, isSuccess, errorStr) in
            if isSuccess {
                self.aryAds = House.getMyAds(responseDict!["billboards"] as! NSArray)
                self.aryRecommendedAds = House.getMyAds(responseDict!["billboards"] as! NSArray)

                self.collctnVwAds.reloadData()
                self.collctnVwRecomendAds.reloadData()
            }else {
                showAlert(title: "B-App", message: errorStr!, controller: self)
            }
        }
    }
    
    func getFilteredAds() {
        
        var param = [String:Any]()
        if sortDetails.sortEnabled {
            if sortDetails.sortCondition == SortCondition.price {
                param.updateValue("Price", forKey: "sort_by")
            }else {
                param.updateValue("Distance", forKey: "sort_by")
            }
        }
        
        if filterDetails.filterEnabled {
            if filterDetails.priceRangeStart != 0 {
                param.updateValue(filterDetails.priceRangeStart, forKey: "min_price")
                param.updateValue(filterDetails.priceRangeEnd, forKey: "max_price")
            }
            if filterDetails.size != 0 {
                param.updateValue(filterDetails.size, forKey: "min_board_size")
            }
//            if filterDetails.region != "" {
//                param.updateValue(filterDetails.region, forKey: "region")
//            }
        }
        if UserDefaults.standard.value(forKey: "lat") != nil {
            param.updateValue("\(UserDefaults.standard.value(forKey: "lat") as! String),\(UserDefaults.standard.value(forKey: "long") as! String)", forKey: "coordinate")
        }else {
            showAlert(title: "B-App", message: "Unable to get your location.", controller: self)
            return
        }
        
        print(param)
        
        ApiManager.sharedObj.requestApi(API_MyBillboards, method: .get, param: param) { (responseDict, isSuccess, errorStr) in
            if isSuccess {
                self.aryAds = House.getMyAds(responseDict!["billboards"] as! NSArray)
                self.aryRecommendedAds = House.getMyAds(responseDict!["billboards"] as! NSArray)
                
                self.collctnVwAds.reloadData()
                self.collctnVwRecomendAds.reloadData()
            }else {
                showAlert(title: "B-App", message: errorStr!, controller: self)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
