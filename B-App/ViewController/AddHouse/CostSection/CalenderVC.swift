//
//  CalenderVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/8/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import FSCalendar

class CalenderVC: UIViewController ,FSCalendarDelegate{

    @IBOutlet weak var calenderVw: FSCalendar!
    
    var dateFirst: Date? = nil
    var dateSecond: Date? = nil
    var dateFirstStr = ""
    var dateSecondStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calenderVw.delegate = self
        calenderVw.allowsMultipleSelection = true
        
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if date < Date() {
            showAlert(title: "B-App", message: "You can not select previous dates", controller: self)
            calenderVw.deselect(date)
        }else {
            if dateFirst == nil {
                dateFirst = date
            }else {
                if dateFirst != nil {
                    calenderVw.deselect(dateFirst!)
                }
                if dateSecond != nil {
                    calenderVw.deselect(dateSecond!)
                }
                if date < dateFirst! {
                    dateSecond = dateFirst
                    dateFirst = date
                }else {
                    dateSecond = date
                }
                
                calenderVw.select(dateFirst)
                calenderVw.select(dateSecond)
                //                let dateAry = generateDatesArrayBetweenTwoDates(startDate: dateFirst!, endDate: dateSecond!)
                //                for dt in dateAry {
                //                    calenderVw.select(dt)
                //                }
                dateFirstStr = getDateStr(dateFirst!)
                dateSecondStr = getDateStr(dateSecond!)
                
            }
        }
        
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if dateFirst == date {
            dateFirst = nil
        }else {
            dateSecond = nil
        }
    }
    //MARK: - Buttons actions
    @IBAction func actionBackBtn(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSaveExitBtn(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func actionContinueBtn(_ sender: AnyObject) {
        House.newHouse.bookDateStart = dateFirstStr
        House.newHouse.bookDateEnd = dateSecondStr
        self.pushViewController(controllerName: "ConfirmAgreementVC", storyboardName: AddHouseStoryboard)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
