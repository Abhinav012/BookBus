//
//  BookingPolicyTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 13/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BookingPolicyTableViewCell: UITableViewCell {

    @IBOutlet weak var reschedulePolicyLabel: UILabel!
    
    @IBOutlet weak var cancellationPolicyTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
