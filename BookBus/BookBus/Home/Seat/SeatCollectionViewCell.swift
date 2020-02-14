//
//  SeatCollectionViewCell.swift
//  BookBus
//
//  Created by Thanos on 08/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var seatImageView: UIImageView!
    var isInSelectedState = false
    
    func updateImage(){
        isInSelectedState.toggle()
        
        if isInSelectedState{
            seatImageView.image = UIImage(named: "selected-bus-seat")
        }else{
            seatImageView.image = UIImage(named: "unselected-bus-seat")
        }
    }
}
