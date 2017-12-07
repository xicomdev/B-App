//
//  MsgListTVCell.swift
//  B-App
//
//  Created by Ankit Chhabra on 9/11/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class MsgListTVCell: UITableViewCell {

    @IBOutlet weak var lblUnreadMsgCount: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblLastMsg: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgvwUser: SetCornerImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
