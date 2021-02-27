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
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var messageContent: UILabel!
    override func awakeFromNib() {
        
        senderName.layer.cornerRadius = 5
        senderName.layer.masksToBounds = true
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
