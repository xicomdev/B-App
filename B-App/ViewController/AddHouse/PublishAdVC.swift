
//
//  PublishAdVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/27/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class PublishAdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionPublish(_ sender: Any) {
//        let param = [
//            "category": House.newHouse.accomodationType ,
//            "coordinate": [
//                "latitude": House.newHouse.lattitude,
//                "longitude": House.newHouse.longitude
//            ],
//            "address": House.newHouse.address,
//            "board_size": [
//                "width": "\(Int(House.newHouse.areaSIze)!/2)",
//                "height": "\(Int(House.newHouse.areaSIze)!/2)"
//            ],
//            "sale_plans": [
//                [
//                    "price": House.newHouse.startPrice,
//                    "unit": House.newHouse.costType,
//                    "times": [
//                        "from": House.newHouse.bookDateStart,
//                        "until": House.newHouse.bookDateEnd
//                    ]
//                ]
//            ]
//            ] as! [String : Any]
//
//
//        ApiManager.sharedObj.requestApi(API_Billboards, method: .post, param: param) { (responseDict, isSuccess, errorStr) in
//            if isSuccess {
//                House.newHouse = House()
//                self.pushViewController(controllerName: "CongratulationVC", storyboardName: AddHouseStoryboard)
//            }else {
//                showAlert(title: "B-App", message: errorStr!, controller: self)
//            }
//        }
        self.pushViewController(controllerName: "CongratulationVC", storyboardName: AddHouseStoryboard)

    }
    
    @IBAction func actionMoreDetail(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
