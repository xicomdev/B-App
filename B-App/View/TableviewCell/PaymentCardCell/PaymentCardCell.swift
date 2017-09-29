//
//  PaymentCardCell.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/28/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class PaymentCardCell: UITableViewCell {

    @IBOutlet weak var imgvwRadio: UIImageView!
    @IBOutlet weak var lblCardNo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
