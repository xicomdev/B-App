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

        calenderVw.delegate = self
        calenderVw.allowsMultipleSelection = true
        txtfldEndDate.isUserInteractionEnabled = false
        txtfldstartDate.isUserInteractionEnabled = false
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
                let startDateTuple : (dayStr:String, dateStr:String) = getDayAndDateString(dateFirst!)
                let endDateTuple: (dayStr:String, dateStr:String) = getDayAndDateString(dateSecond!)
                
                txtfldstartDate.text = startDateTuple.dateStr
                lblStartDay.text = startDateTuple.dayStr
                
                lblEndDay.text = endDateTuple.dayStr
                txtfldEndDate.text = endDateTuple.dateStr
                
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
    
   
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionReset(_ sender: Any) {
    }
    @IBAction func actionApply(_ sender: Any) {
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: dateFirst!)
        let date2 = calendar.startOfDay(for: dateSecond!)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        Booking.newBooking.noOFDays = components.day!
        Booking.newBooking.startDate = getDateStrWithSimpleFormat(dateFirst!)
        Booking.newBooking.endDate = getDateStrWithSimpleFormat(dateSecond!)
        self.pushViewController(controllerName: "SelectPaymentMethodVC", storyboardName: bookingStoryboard)
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
