//
//  BusTypeTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 07/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BusTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var seaterImgView: UIImageView!
    @IBOutlet weak var seaterLbl: UILabel!
    
    @IBOutlet weak var acImgView: UIImageView!
    @IBOutlet weak var acLbl: UILabel!
    
    var state = [false, false]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func updateOption1(_ sender: Any) {
        state[0].toggle()
        
        if state[0] == true{
            
            seaterImgView.tintColor = UIColor.themeRed
            seaterLbl.tintColor = UIColor.themeRed
            FilterInfo.filter.busTypes?.append(.seater)
        }else{
            seaterImgView.tintColor = UIColor.black
            seaterLbl.tintColor = UIColor.black
            
            FilterInfo.filter.busTypes =  FilterInfo.filter.busTypes?.filter({ (bus) -> Bool in
            
                return bus != .seater
            })
            
        }
        
        
    }
    
    @IBAction func updateOption2(_ sender: Any) {
        state[1].toggle()
        
        if state[1] == true{
            
            acImgView.tintColor = UIColor.themeRed
            acLbl.tintColor = UIColor.themeRed
            FilterInfo.filter.busTypes?.append(.airConditioned)
        }else{
            
            acImgView.tintColor = UIColor.black
            acLbl.tintColor = UIColor.black
            
            FilterInfo.filter.busTypes =  FilterInfo.filter.busTypes?.filter({ (bus) -> Bool in
                
                return bus != .airConditioned
            })
        }
        
    }
    
}
