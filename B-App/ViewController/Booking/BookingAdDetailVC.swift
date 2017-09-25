//
//  BookingAdDetailVC.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/25/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class BookingAdDetailVC: UIViewController {

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
    @IBOutlet weak var imgVwAd: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func actionBack(_ sender: Any) {
    }
    @IBAction func actionLearnMore(_ sender: Any) {
    }

    @IBAction func actionMoreAds(_ sender: Any) {
    }
    @IBAction func actionContactOwner(_ sender: Any) {
    }
    @IBAction func actionBook(_ sender: Any) {
    }
    @IBAction func actionFavourite(_ sender: Any) {
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
