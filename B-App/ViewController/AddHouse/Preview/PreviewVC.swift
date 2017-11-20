//
//  PreviewVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import GoogleMaps
import Kingfisher

class PreviewVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GMSMapViewDelegate {

    @IBOutlet weak var lblLocationBottm: UILabel!
    @IBOutlet weak var mapvw: GMSMapView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblOwnerName: UILabel!
    @IBOutlet weak var imgvwOwner: SetCornerImageView!
    @IBOutlet weak var collctnvwImages: UICollectionView!
    
    var aryImages = [String]()
    var houseInfo = House()
    var coordinates = CLLocationCoordinate2D()
    let marker = GMSMarker()
    override func viewDidLoad() {
        super.viewDidLoad()

        aryImages = houseInfo.aryImgUrls
        lblOwnerName.text = houseInfo.ownerInfo.fullname
        lblAddress.text = houseInfo.address
        lblLocationBottm.text = houseInfo.address
        coordinates.latitude = houseInfo.lattitude
        coordinates.longitude = houseInfo.longitude

        mapvw.delegate = self
        marker.appearAnimation = .pop
        marker.map = mapvw
        marker.icon = #imageLiteral(resourceName: "pin_big")
        marker.position = coordinates

        imgvwOwner.kf.setImage(with: URL(string: houseInfo.ownerInfo.imageURL), placeholder: #imageLiteral(resourceName: "user_icon"))
        let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 14.0)
        mapvw.animate(to: camera)
        if aryImages.count == 0 {
            aryImages.append("")
        }
        collctnvwImages.delegate = self
        collctnvwImages.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collctnvwImages.dequeueReusableCell(withReuseIdentifier: "HouseImgPreviewColCell", for: indexPath) as! HouseImgPreviewColCell
        cell.imgvwHouse.kf.setImage(with: URL(string: aryImages[indexPath.item]), placeholder: #imageLiteral(resourceName: "noImg"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collctnvwImages.frame.width, height: 250)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
