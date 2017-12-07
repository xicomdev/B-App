//
//  SortByVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/12/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

struct SortInfo {
    var sortEnabled = false
    var sortCondition: SortCondition? = nil
    
}

enum SortCondition : String {
    case pending = "Pending",
        placeNearToFar = "Place near to far",
        placeFarToNear = "Place far to near",
        price = "Price"
}

var sortDetails : SortInfo = SortInfo()

class SortByVC: UIViewController {

    @IBOutlet weak var radioBtnPlaceFarNear: UIButton!
    @IBOutlet weak var radioBtnPlaceNearFar: UIButton!
    @IBOutlet weak var radioBtnPrice: UIButton!
    @IBOutlet weak var radioBtnPending: UIButton!
    
    var selectedCondition: SortCondition? = nil
    var selectionDelegate: MSSelectionCallback!
    override func viewDidLoad() {
        super.viewDidLoad()
        if sortDetails.sortEnabled {
            switch sortDetails.sortCondition! {
            case .pending:
                radioBtnPending.isSelected = true
                radioBtnPrice.isSelected = false
                radioBtnPlaceNearFar.isSelected = false
                radioBtnPlaceFarNear.isSelected = false
                selectedCondition = .pending
                break
            case .placeNearToFar:
                radioBtnPending.isSelected = false
                radioBtnPrice.isSelected = false
                radioBtnPlaceNearFar.isSelected = true
                radioBtnPlaceFarNear.isSelected = false
                selectedCondition = .placeNearToFar
                break
            case .placeFarToNear:
                radioBtnPending.isSelected = false
                radioBtnPrice.isSelected = false
                radioBtnPlaceNearFar.isSelected = false
                radioBtnPlaceFarNear.isSelected = true
                selectedCondition = .placeFarToNear
                break
            case .price:
                radioBtnPending.isSelected = false
                radioBtnPrice.isSelected = true
                radioBtnPlaceNearFar.isSelected = false
                radioBtnPlaceFarNear.isSelected = false
                selectedCondition = .price
                break
            }
            
        }

        // Do any additional setup after loading the view.
    }

    //MARK: - Buttons actions

    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionResetBtn(_ sender: AnyObject) {
        sortDetails.sortCondition = nil
        sortDetails.sortEnabled = false
    }
    
    @IBAction func actionRadioPending(_ sender: AnyObject) {
        radioBtnPending.isSelected = true
        radioBtnPrice.isSelected = false
        radioBtnPlaceNearFar.isSelected = false
        radioBtnPlaceFarNear.isSelected = false
        selectedCondition = .pending
    }
    
    @IBAction func actionRadioPrice(_ sender: AnyObject) {
        radioBtnPending.isSelected = false
        radioBtnPrice.isSelected = true
        radioBtnPlaceNearFar.isSelected = false
        radioBtnPlaceFarNear.isSelected = false
        selectedCondition = .price
    }
    
    @IBAction func actionRadioPlaceNearFar(_ sender: AnyObject) {
        radioBtnPending.isSelected = false
        radioBtnPrice.isSelected = false
        radioBtnPlaceNearFar.isSelected = true
        radioBtnPlaceFarNear.isSelected = false
        selectedCondition = .placeNearToFar
    }
    
    @IBAction func actionRadioPlaceFarNear(_ sender: AnyObject) {
        radioBtnPending.isSelected = false
        radioBtnPrice.isSelected = false
        radioBtnPlaceNearFar.isSelected = false
        radioBtnPlaceFarNear.isSelected = true
        selectedCondition = .placeFarToNear
    }
    
    @IBAction func actionApplyBtn(_ sender: AnyObject) {
        sortDetails.sortEnabled = true
        sortDetails.sortCondition = selectedCondition
        if selectionDelegate != nil {
            selectionDelegate.moveWithSortSelection!()
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
