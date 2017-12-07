
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
        
//        let ary1 = [
//            "latitude": House.newHouse.lattitude,
//            "longitude": House.newHouse.longitude
//        ]
//
//        let ary2 = [
//            "width": "\(Int(House.newHouse.areaSIze)!/2)",
//            "height": "\(Int(House.newHouse.areaSIze)!/2)"
//        ]
//
//        let ary3 = [
//            [
//                "price": House.newHouse.startPrice,
//                "unit": House.newHouse.costType,
//                "times": [
//                    "from": House.newHouse.bookDateStart,
//                    "until": House.newHouse.bookDateEnd
//                ]
//            ]
//        ]
//        let jsonData1 = try! JSONSerialization.data(withJSONObject: ary1, options: JSONSerialization.WritingOptions.prettyPrinted)
//
//        let JSONString1 = String(data: jsonData1, encoding: String.Encoding.utf8)
//
//        let jsonData2 = try! JSONSerialization.data(withJSONObject: ary2, options: JSONSerialization.WritingOptions.prettyPrinted)
//
//        let JSONString2 = String(data: jsonData2, encoding: String.Encoding.utf8)
//
//        let jsonData3 = try! JSONSerialization.data(withJSONObject: ary3, options: JSONSerialization.WritingOptions.prettyPrinted)
//
//        let JSONString3 = String(data: jsonData3, encoding: String.Encoding.utf8)
//
//        let param = [
//            "category": House.newHouse.accomodationType ,
//            "coordinate": JSONString1!,
//            "address": House.newHouse.address,
//            "board_size": JSONString2!,
//            "sale_plans": JSONString3!
//            ] as! [String : Any]
        
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
//        ApiManager.sharedObj.postRequestWithBody(API_Billboards, param: param) { (responseDict, isSuccess, errorStr) in
//            if isSuccess {
//                House.newHouse = House()
//                self.pushViewController(controllerName: "CongratulationVC", storyboardName: AddHouseStoryboard)
//            }else {
//                showAlert(title: "B-App", message: errorStr!, controller: self)
//            }
//        }
        let param = House.newHouse.toDictionary()
        print(param)
        ApiManager.sharedObj.requestApi(API_Billboards, method: .post, param: param) { (responseDict, isSuccess, errorStr) in
            if isSuccess {
                House.newHouse = House()
                self.pushViewController(controllerName: "CongratulationVC", storyboardName: AddHouseStoryboard)
            }else {
                showAlert(title: "B-App", message: errorStr!, controller: self)
            }
        }
//        self.pushViewController(controllerName: "CongratulationVC", storyboardName: AddHouseStoryboard)

    }
    
    @IBAction func actionMoreDetail(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
