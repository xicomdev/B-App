//
//  MyAdsTVCell.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit
import Kingfisher

class MyAdsTVCell: UITableViewCell {

    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imgvw: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblArea.layer.cornerRadius = lblArea.frame.height / 2
        lblArea.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showMyAd(_ objHouse: House) {
    
        lblArea.attributedText = getAreaInMeters(objHouse.areaSIze, lblArea: lblArea)
        lblAddress.text = objHouse.address
        lblPrice.text = objHouse.startPrice + (objHouse.costType == "Hourly" ? " per hour" : "")
        if objHouse.aryImgUrls.count > 0 {
            imgvw.kf.setImage(with: URL(string: objHouse.aryImgUrls[0]))
        }
        
    }
    
    
}
