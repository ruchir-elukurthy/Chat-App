//
//  MessageCell.swift
//  Chat-App
//
//  Created by Ruchir on 2/26/21.
//

import UIKit
import QuartzCore

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var senderName: UILabel!
    override func awakeFromNib() {
        
        senderName.layer.cornerRadius = 5
        senderName.layer.masksToBounds = true
        receiverName.layer.cornerRadius = 5
        receiverName.layer.masksToBounds = true
        messageContent.layer.cornerRadius = messageContent.frame.size.height/4;
        messageContent.layer.masksToBounds = true
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
