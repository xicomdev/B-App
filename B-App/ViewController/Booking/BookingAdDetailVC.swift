//
//  BookingAdDetailVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import GoogleMaps

class BookingAdDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GMSMapViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var mapvw: GMSMapView!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var btnBook: UIButton!
    @IBOutlet weak var btnContactOwner: UIButton!
    @IBOutlet weak var lblAddress1: UILabel!
    @IBOutlet weak var collctnVwMoreAds: UICollectionView!
    @IBOutlet weak var btnMoreAds: UIButton!
    @IBOutlet weak var btnLearnMore: UIButton!
    @IBOutlet weak var lblBeforeJoinText: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblUserStatus: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgVwUser: SetCornerImageView!
    @IBOutlet weak var imgVwAd: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibAd = UINib(nibName: "HouseAdCVCell", bundle: nil)
        collctnVwMoreAds.register(nibAd, forCellWithReuseIdentifier: "HouseAdCVCell")
        collctnVwMoreAds.delegate = self
        collctnVwMoreAds.dataSource = self
        
        mapvw.delegate = self
        if UserDefaults.standard.value(forKey: "lat") != nil {
            let camera = GMSCameraPosition.camera(withLatitude: Double(UserDefaults.standard.value(forKey: "lat") as! String)!, longitude: Double(UserDefaults.standard.value(forKey: "long") as! String)!, zoom: 12.0)
            mapvw.animate(to: camera)
        }

    }
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionLearnMore(_ sender: Any) {
        
    }

    @IBAction func actionMoreAds(_ sender: Any) {
    }
    @IBAction func actionContactOwner(_ sender: Any) {
    }
    @IBAction func actionBook(_ sender: Any) {
        self.pushViewController(controllerName: "SelectBookingDatesVC", storyboardName: bookingStoryboard)
    }
    @IBAction func actionFavourite(_ sender: Any) {
        btnFavourite.isSelected = !btnFavourite.isSelected
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
        
        return CGSize(width: collctnVwMoreAds.frame.width * 3 / 5, height: collctnVwMoreAds.frame.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
