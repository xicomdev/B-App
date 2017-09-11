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
        collctnVwAds.reloadData()

    }

    //MARK: - Buttons Actions
    
    @IBAction func actionBackBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSearchBtn(_ sender: AnyObject) {
    }
    @IBAction func actionOptionsBtn(_ sender: AnyObject) {
    }
    @IBAction func actionMyAdsBtn(_ sender: AnyObject) {
    }
    @IBAction func actionDesiredAdsBtn(_ sender: AnyObject) {
    }
    @IBAction func actionFilterBtn(_ sender: AnyObject) {
    }
    @IBAction func actionSortByBtn(_ sender: AnyObject) {
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
        return CGSize(width: collctnVwAds.frame.width - 40, height: 240)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
