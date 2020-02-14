//
//  Extension+View.swift
//  BookBus
//
//  Created by Thanos on 12/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    
    func setupBorder(with color: UIColor, width: CGFloat){
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func setupShadow(color: UIColor){
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1
    }
}
