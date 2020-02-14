//
//  SearchResultTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 04/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var placeholderImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
