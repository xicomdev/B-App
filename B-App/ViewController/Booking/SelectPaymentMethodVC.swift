//
//  SelectPaymentMethodVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SelectPaymentMethodVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblPayments: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblPayments.registerNibsForCells(arryNib: ["PaymentCardCell"])
        tblPayments.delegate = self
        tblPayments.dataSource = self
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionContinue(_ sender: Any) {
        self.pushViewController(controllerName: "ReviewBookingDetailVC", storyboardName: bookingStoryboard)
    }
    
    @IBAction func actionNewCard(_ sender: Any) {
    }
    
    //MARK: - Table Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblPayments.dequeueReusableCell(withIdentifier: "PaymentCardCell", for: indexPath) as! PaymentCardCell
        return cell
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
