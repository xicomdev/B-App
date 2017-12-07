//
//  HouseAdCVCell.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class HouseAdCVCell: UICollectionViewCell {

    @IBOutlet weak var btnLearnMore: UIButton!
    @IBOutlet weak var lblAreaSize: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var imgvw: SetCornerImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblAreaSize.layer.cornerRadius = lblAreaSize.frame.height / 2
        lblAreaSize.clipsToBounds = true
        // Initialization code
    }

    func showData(_ objHouse: House) {
        
        lblAreaSize.attributedText = getAreaInMeters(objHouse.areaSIze, lblArea: lblAreaSize)
        lblAddress.text = objHouse.address
        lblPrice.text = objHouse.startPrice + (objHouse.costType == "Hourly" ? " per hour" : "")
        if objHouse.aryImgUrls.count > 0 {
            imgvw.kf.setImage(with: URL(string: objHouse.aryImgUrls[0]))
        }
    }
}
