//
//  SortByTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 07/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class SortByTableViewCell: UITableViewCell {

    @IBOutlet weak var cheapestOptionBtn: UIButton!
    @IBOutlet weak var bestRatedOptionBtn: UIButton!
    @IBOutlet weak var earlyDepartureOptionBtn: UIButton!
    @IBOutlet weak var lateDepartureBtn: UIButton!
    
    
    @IBOutlet weak var cheapestOptionImgView: UIImageView!
    @IBOutlet weak var bestRatedOptionImgView: UIImageView!
    @IBOutlet weak var earlyDepOptionImgView: UIImageView!
    @IBOutlet weak var lateDepartureOptionImgView: UIImageView!
    
    var sortBy = SortBy(rawValue: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func optionSelected(_ sender: UIButton) {
        
        if sender.tag == 0{
            cheapestOptionBtn.setTitleColor(UIColor.themeRed, for: .normal)
            cheapestOptionImgView.image = UIImage(named: "checked-radio-button")
            
            bestRatedOptionBtn.setTitleColor(UIColor.black, for: .normal)
            earlyDepartureOptionBtn.setTitleColor(UIColor.black, for: .normal)
            lateDepartureBtn.setTitleColor(UIColor.black, for: .normal)
            
            bestRatedOptionImgView.image = UIImage(named: "unchecked-radio-button")
            earlyDepOptionImgView.image = UIImage(named: "unchecked-radio-button")
            lateDepartureOptionImgView.image = UIImage(named: "unchecked-radio-button")
            
            sortBy = SortBy.cheapest
        }
        else if sender.tag == 1{
            bestRatedOptionBtn.setTitleColor(UIColor.themeRed, for: .normal)
            bestRatedOptionImgView.image = UIImage(named: "checked-radio-button")
            
            cheapestOptionBtn.setTitleColor(UIColor.black, for: .normal)
            earlyDepartureOptionBtn.setTitleColor(UIColor.black, for: .normal)
            lateDepartureBtn.setTitleColor(UIColor.black, for: .normal)
            
            cheapestOptionImgView.image = UIImage(named: "unchecked-radio-button")
            earlyDepOptionImgView.image = UIImage(named: "unchecked-radio-button")
            lateDepartureOptionImgView.image = UIImage(named: "unchecked-radio-button")
            
            sortBy = SortBy.bestRate
        }
        else if sender.tag == 2{
           earlyDepartureOptionBtn.setTitleColor(UIColor.themeRed, for: .normal)
            earlyDepOptionImgView.image = UIImage(named: "checked-radio-button")
            
            cheapestOptionBtn.setTitleColor(UIColor.black, for: .normal)
            bestRatedOptionBtn.setTitleColor(UIColor.black, for: .normal)
            lateDepartureBtn.setTitleColor(UIColor.black, for: .normal)
            
            cheapestOptionImgView.image = UIImage(named: "unchecked-radio-button")
            bestRatedOptionImgView.image = UIImage(named: "unchecked-radio-button")
            lateDepartureOptionImgView.image = UIImage(named: "unchecked-radio-button")
            
            sortBy = SortBy.earlyDeparture
        }
        else if sender.tag == 3{
            lateDepartureBtn.setTitleColor(UIColor.themeRed, for: .normal)
            lateDepartureOptionImgView.image = UIImage(named: "checked-radio-button")
            
            cheapestOptionBtn.setTitleColor(UIColor.black, for: .normal)
            bestRatedOptionBtn.setTitleColor(UIColor.black, for: .normal)
            earlyDepartureOptionBtn.setTitleColor(UIColor.black, for: .normal)
            
            cheapestOptionImgView.image = UIImage(named: "unchecked-radio-button")
            bestRatedOptionImgView.image = UIImage(named: "unchecked-radio-button")
            earlyDepOptionImgView.image = UIImage(named: "unchecked-radio-button")
            
            sortBy = SortBy.lateDeparture
        }
        
        FilterInfo.filter.sortBy = self.sortBy
    }
    
    

}
