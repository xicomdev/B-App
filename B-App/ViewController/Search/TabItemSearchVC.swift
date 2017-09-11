//
//  TabItemSearchVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class TabItemSearchVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var btnSortBy: UIButton!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var collctnVwAds: UICollectionView!
    @IBOutlet weak var collctnVwRecomendAds: UICollectionView!
    @IBOutlet weak var btnMoreAds: UIButton!
    @IBOutlet weak var btnSearchHouse: UIButton!
    @IBOutlet weak var btnSearchAd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let nibAd = UINib(nibName: "HouseAdCVCell", bundle: nil)
        collctnVwRecomendAds.register(nibAd, forCellWithReuseIdentifier: "HouseAdCVCell")
        collctnVwAds.register(nibAd, forCellWithReuseIdentifier: "HouseAdCVCell")
        
        collctnVwAds.delegate = self
        collctnVwAds.dataSource = self
        collctnVwAds.reloadData()
        collctnVwRecomendAds.delegate = self
        collctnVwRecomendAds.dataSource = self
        collctnVwRecomendAds.reloadData()
    }
    
    //MARK: - Buttons Actions

    @IBAction func actionMoreAdsBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSearchAdBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSearchHouseBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSortbyBtn(_ sender: AnyObject) {
    }
    @IBAction func actionFIlterBtn(_ sender: AnyObject) {
    }
    
    //MARK:- CollectionView delegate and datasource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HouseAdCVCell", for: indexPath) as! HouseAdCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collctnVwRecomendAds {
            return CGSize(width: collctnVwRecomendAds.frame.width * 4 / 5, height: collctnVwRecomendAds.frame.height)
        }else {
            return CGSize(width: (collctnVwAds.frame.width - 30)/2, height: collctnVwAds.frame.height)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
