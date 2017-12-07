//
//  BookingAdDetailVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import GoogleMaps
import Kingfisher

class BookingAdDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GMSMapViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collctnvwImages: UICollectionView!
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
    
    var aryImages = [String]()
    var houseInfo = House()
    var coordinates = CLLocationCoordinate2D()
    let marker = GMSMarker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if House.selectedHouse != nil {
            houseInfo = House.selectedHouse!
        }
        let nibAd = UINib(nibName: "HouseAdCVCell", bundle: nil)
        collctnVwMoreAds.register(nibAd, forCellWithReuseIdentifier: "HouseAdCVCell")
        collctnVwMoreAds.delegate = self
        collctnVwMoreAds.dataSource = self
        
        aryImages = houseInfo.aryImgUrls
        lblUserName.text = houseInfo.ownerInfo.fullname
        lblAddress.text = houseInfo.address
        lblAddress1.text = houseInfo.address
        coordinates.latitude = houseInfo.lattitude
        coordinates.longitude = houseInfo.longitude
        
        mapvw.delegate = self
        marker.appearAnimation = .pop
        marker.map = mapvw
        marker.icon = #imageLiteral(resourceName: "pin_big")
        marker.position = coordinates
        
        let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 14.0)
        mapvw.animate(to: camera)
        if aryImages.count == 0 {
            aryImages.append("")
        }
        collctnvwImages.delegate = self
        collctnvwImages.dataSource = self
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
        if collectionView == collctnvwImages {
            return aryImages.count
        }else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collctnvwImages {
            let cell = collctnvwImages.dequeueReusableCell(withReuseIdentifier: "HouseImgPreviewColCell", for: indexPath) as! HouseImgPreviewColCell
            cell.imgvwHouse.kf.setImage(with: URL(string: aryImages[indexPath.item]), placeholder: #imageLiteral(resourceName: "noImg"))
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HouseAdCVCell", for: indexPath) as! HouseAdCVCell
            cell.btnHeart.addTarget(self, action: #selector(actionFavBtn(_:)), for: .touchUpInside)
            cell.btnHeart.tag = indexPath.item
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collctnvwImages {
            return CGSize(width: collctnvwImages.frame.width, height: 250)
        }else {
            return CGSize(width: collctnVwMoreAds.frame.width * 3 / 5, height: collctnVwMoreAds.frame.height)
        }
    }
    
    @objc func actionFavBtn(_ sender: UIButton) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
