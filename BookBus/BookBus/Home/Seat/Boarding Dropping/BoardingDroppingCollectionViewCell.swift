//
//  BoardingDroppingCollectionViewCell.swift
//  BookBus
//
//  Created by Thanos on 12/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BoardingDroppingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var pointLabel: UILabel!
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                indicatorView.backgroundColor = #colorLiteral(red: 0.4846939445, green: 0.4937036633, blue: 0.554169476, alpha: 1)
            }else {
                indicatorView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
}
