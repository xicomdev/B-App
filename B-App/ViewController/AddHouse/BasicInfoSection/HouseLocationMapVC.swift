//
//  HouseLocationMapVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import GoogleMaps

class HouseLocationMapVC: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var mapvw: GMSMapView!
    var markerLocation = CLLocationCoordinate2D()
    var locationSelected = Bool()
    let marker = GMSMarker()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapvw.delegate = self
        marker.appearAnimation = .pop
        marker.map = mapvw
        marker.icon = #imageLiteral(resourceName: "pin_big")

    }

    override func viewWillAppear(_ animated: Bool) {
        
        if House.newHouse.lattitude != 0.0 {
            let camera = GMSCameraPosition.camera(withLatitude: House.newHouse.lattitude, longitude: House.newHouse.longitude, zoom: 12.0)
            mapvw.animate(to: camera)
            marker.position = CLLocationCoordinate2D(latitude: House.newHouse.lattitude, longitude: House.newHouse.longitude)
            locationSelected = true
            markerLocation = CLLocationCoordinate2D(latitude: House.newHouse.lattitude, longitude: House.newHouse.longitude)
        }
        else if UserDefaults.standard.value(forKey: "lat") != nil {
            let camera = GMSCameraPosition.camera(withLatitude: Double(UserDefaults.standard.value(forKey: "lat") as! String)!, longitude: Double(UserDefaults.standard.value(forKey: "long") as! String)!, zoom: 14.0)
            mapvw.animate(to: camera)
        }
        
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        marker.position = coordinate
        locationSelected = true
        markerLocation = coordinate
    }
    
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        House.newHouse.lattitude = markerLocation.latitude
        House.newHouse.longitude = markerLocation.longitude
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        if locationSelected {
            House.newHouse.lattitude = markerLocation.latitude
            House.newHouse.longitude = markerLocation.longitude
            if House.newHouse.stageCompleted == 0 {
                House.newHouse.stageCompleted = 2
            }
            self.navigationController?.popToRootViewController(animated: true)
        }else
        {
            showAlert(title: "B-App", message: "Please pick your location first", controller: self)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
