//
//  SentMsgCell.swift
//  B-App
//
//  Created by Ankit Chhabra on 11/7/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import UIKit

class SentMsgCell: UITableViewCell {

//    var message : Message!
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblMsg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
//    func setMessageDetails( msgInfo : Message)
//    {
//        message = msgInfo
//        imgVwUser.sd_setImage(with: URL(string : msgInfo.senderUser.imageURL )   , placeholderImage: userPlaceHolder)
//        lblMsg.text = message.message
//        lblTime.text = getMessageTime(timestamp: message.timestamp)
//    }

}