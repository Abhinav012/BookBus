//
//  FeatureTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 07/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class FeatureTableViewCell: UITableViewCell {

    @IBOutlet weak var featureImgView: UIImageView!
    @IBOutlet weak var featureLbl: UILabel!
    @IBOutlet weak var featureSelectionBtn: UIButton!
    var isFeatureSelected: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func didTappedFeatureSelectionBtn(_ sender: UIButton) {
        isFeatureSelected.toggle()
        
        if isFeatureSelected{
            featureSelectionBtn.setImage(UIImage(named: "checked-checkbox"), for: .normal)
            FilterInfo.filter.feature?.append(featureLbl.text!)
        }else{
             featureSelectionBtn.setImage(UIImage(named: "unchecked-checkbox"), for: .normal)
            FilterInfo.filter.feature=FilterInfo.filter.feature?.filter({ (str) -> Bool in
                
                return str != featureLbl.text!
            })
            
        }
        
    }
    
    
}
