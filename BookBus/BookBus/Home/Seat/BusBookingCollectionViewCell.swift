//
//  BusBookingCollectionViewCell.swift
//  BookBus
//
//  Created by Thanos on 10/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BusBookingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var selectionView: UIView!
    
//    override var isSelected: Bool{
//        didSet{
//            if isSelected{
//            selectionView.backgroundColor = #colorLiteral(red: 0.8467031121, green: 0.2987058163, blue: 0.3427696228, alpha: 1)
//            }else {
//                selectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            }
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailImageView.layer.cornerRadius = detailImageView.frame.width/2
        
        
        
    }
}
