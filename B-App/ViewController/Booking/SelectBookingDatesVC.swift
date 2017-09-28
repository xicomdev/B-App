//
//  SelectBookingDatesVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import FSCalendar

class SelectBookingDatesVC: UIViewController, FSCalendarDelegate {

    @IBOutlet weak var lblEndDay: UILabel!
    @IBOutlet weak var lblStartDay: UILabel!
    @IBOutlet weak var txtfldEndDate: UITextField!
    @IBOutlet weak var txtfldstartDate: UITextField!
    @IBOutlet weak var calenderVw: FSCalendar!
    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnTotalCost: UIButton!
    
    var dateFirst: Date? = nil
    var dateSecond: Date? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calenderVw.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if date < Date() {
            showAlert(title: "B-App", message: "You can not select previous dates", controller: self)
            calenderVw.deselect(date)
        }else {
            if dateFirst == nil {
                dateFirst = date
            }else {
                if date < dateFirst! {
                    dateSecond = dateFirst
                    dateFirst = date
                }else {
                    dateSecond = date
                }
                
                
                
            }
        }
       
    }
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionReset(_ sender: Any) {
    }
    @IBAction func actionApply(_ sender: Any) {
        self.pushViewController(controllerName: "BeforeBookOptionsVC", storyboardName: bookingStoryboard)
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
