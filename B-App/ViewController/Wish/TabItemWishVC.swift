//
//  TabItemWishVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class TabItemWishVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collctnVwAds: UICollectionView!
    @IBOutlet weak var btnSortBy: UIButton!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var btnDesiredAds: UIButton!
    @IBOutlet weak var btnMyAds: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibAd = UINib(nibName: "HouseAdCVCell", bundle: nil)
        collctnVwAds.register(nibAd, forCellWithReuseIdentifier: "HouseAdCVCell")
        
        collctnVwAds.delegate = self
        collctnVwAds.dataSource = self
    }

    //MARK: - Buttons Actions
    
    @IBAction func actionBackBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionSearchBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionOptionsBtn(_ sender: AnyObject) {
    }
    
    @IBAction func actionMyAdsBtn(_ sender: AnyObject) {
        btnDesiredAds.setTitleColor(UIColor.lightGray, for: .normal)
        btnMyAds.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func actionDesiredAdsBtn(_ sender: AnyObject) {
        btnMyAds.setTitleColor(UIColor.lightGray, for: .normal)
        btnDesiredAds.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func actionFilterBtn(_ sender: AnyObject) {
        let filterVc = tabbarStoryboard.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        filterVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(filterVc, animated: true)
    }
    
    @IBAction func actionSortByBtn(_ sender: AnyObject) {
        let sortVc = tabbarStoryboard.instantiateViewController(withIdentifier: "SortByVC") as! SortByVC
        sortVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(sortVc, animated: true)
    }
    
    //MARK: - Tableview delegate and datsource methods 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collctnVwAds.dequeueReusableCell(withReuseIdentifier: "HouseAdCVCell", for: indexPath) as! HouseAdCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collctnVwAds.frame.width - 40, height: self.view.frame.height * 3 / 7)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
