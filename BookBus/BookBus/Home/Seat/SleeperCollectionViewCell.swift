//
//  SleeperCollectionViewCell.swift
//  BookBus
//
//  Created by Thanos on 14/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class SleeperCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sleeperBearthView: UIView!
    var isInSelectedState = false
    
    func updatebearthSelection(){
        isInSelectedState.toggle()
        
        if isInSelectedState{
            sleeperBearthView.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            sleeperBearthView.layer.borderWidth = 1
        }else{
            sleeperBearthView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            sleeperBearthView.layer.borderWidth = 1
        }
    }
}
