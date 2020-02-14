//
//  BookingOptionsCollectionViewCell.swift
//  BookBus
//
//  Created by Thanos on 28/01/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BookingOptionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var optionPlaceholderImage: UIImageView!
    @IBOutlet weak var option: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 5
        layer.shadowOpacity = 1.0
    
    }
    
}
