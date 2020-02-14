//
//  CancellationPolicyTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 13/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class CancellationPolicyTableViewCell: UITableViewCell {

    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
