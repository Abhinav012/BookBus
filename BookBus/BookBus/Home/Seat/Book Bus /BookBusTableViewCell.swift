//
//  BookBusTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 13/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BookBusTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionContainerView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionLabel: UITextView!
    var shouldExpand = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func toggleContentAppearance(_ sender: Any) {
        shouldExpand.toggle()
        
        if shouldExpand{
           heightConstraint.constant = 34
        }
        else{
          heightConstraint.constant = 119
        }
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
           
        }
        
    }
    
}
