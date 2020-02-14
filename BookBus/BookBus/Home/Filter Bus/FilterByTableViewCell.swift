//
//  FilterByTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 07/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class FilterByTableViewCell: UITableViewCell {

    @IBOutlet weak var sunRiseImgView: UIImageView!
    @IBOutlet weak var sunImgView: UIImageView!
    @IBOutlet weak var sunsetImgView: UIImageView!
    @IBOutlet weak var moonImgView: UIImageView!
    
    @IBOutlet weak var morningLbl: UILabel!
    @IBOutlet weak var noonToEveLbl: UILabel!
    @IBOutlet weak var eveToLateNightLbl: UILabel!
    @IBOutlet weak var nightToEarlyMorningLbl: UILabel!
    
    @IBOutlet weak var filterLblTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var filterLabel: UILabel!
    
    @IBOutlet weak var arrivalDepartureLbl: UILabel!
    
    var state = [false,false,false,false]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if tag == 1{
            filterLabel.isHidden = true
            filterLblTopConstraint.constant = 0
            filterLabel.frame.size.height = 0
            arrivalDepartureLbl.text = "BUS ARRIVAL TIME AT DESTINATION"
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func updateFilterInfoForOption1(_ sender: Any) {
        state[0].toggle()
        
        if state[0] == true{
            sunRiseImgView.tintColor = UIColor.themeRed
            morningLbl.textColor = UIColor.themeRed
            if tag == 0
            {
              FilterInfo.filter.departureTime?.append(.betweenMorningAndNoon)
            } else{
                FilterInfo.filter.arrivalTime?.append(.betweenMorningAndNoon)
            }
        }else{
            sunRiseImgView.tintColor = UIColor.black
            morningLbl.textColor = UIColor.black
            if tag == 0{
                FilterInfo.filter.departureTime=FilterInfo.filter.departureTime?.filter { (filterByIime) -> Bool in
                    return filterByIime != FilterByTime.betweenMorningAndNoon
               }
            }
            else{
                FilterInfo.filter.arrivalTime=FilterInfo.filter.arrivalTime?.filter { (filterByIime) -> Bool in
                    return filterByIime != FilterByTime.betweenMorningAndNoon
                }
            
        }
        }
    }
    
    @IBAction func updateFilterInfoForOption2(_ sender: Any) {
        state[1].toggle()
        
        if state[1] == true{
            sunImgView.tintColor = UIColor.themeRed
            noonToEveLbl.textColor = UIColor.themeRed
            if tag == 0{
                FilterInfo.filter.departureTime?.append(.betweenNoonAndEvening)
            } else{
                FilterInfo.filter.arrivalTime?.append(.betweenNoonAndEvening)
            }
        }
        else{
            sunImgView.tintColor = UIColor.black
            noonToEveLbl.textColor = UIColor.black
            if tag == 0{
                FilterInfo.filter.departureTime=FilterInfo.filter.departureTime?.filter { (filterByIime) -> Bool in
                    return filterByIime != FilterByTime.betweenNoonAndEvening
                }
            }else{
                FilterInfo.filter.arrivalTime=FilterInfo.filter.arrivalTime?.filter { (filterByIime) -> Bool in
                    return filterByIime != FilterByTime.betweenNoonAndEvening
                }
            }
            
        }
    }
    
    
    @IBAction func updateFilterInfoForOption3(_ sender: Any) {
        state[2].toggle()
        
        if state[2] == true{
            sunsetImgView.tintColor = UIColor.themeRed
            eveToLateNightLbl.textColor = UIColor.themeRed
            
            if tag == 0{
                FilterInfo.filter.departureTime?.append(.betweenEveningAndNight)
            } else{
                FilterInfo.filter.arrivalTime?.append(.betweenEveningAndNight)
            }
            
        }else{
            sunsetImgView.tintColor = UIColor.black
            eveToLateNightLbl.textColor = UIColor.black
            if tag == 0{
                FilterInfo.filter.departureTime=FilterInfo.filter.departureTime?.filter { (filterByIime) -> Bool in
                    return filterByIime != FilterByTime.betweenEveningAndNight
                }
                
            }else{
                FilterInfo.filter.arrivalTime=FilterInfo.filter.arrivalTime?.filter { (filterByIime) -> Bool in
                    return filterByIime != FilterByTime.betweenEveningAndNight
                }
            }
        }
        
    }
    
    @IBAction func updateFilterInfoForOption4(_ sender: Any) {
        state[3].toggle()
        
        if state[3] == true{
            moonImgView.tintColor = UIColor.themeRed
            nightToEarlyMorningLbl.textColor = UIColor.themeRed
            
            if tag == 0{
                FilterInfo.filter.departureTime?.append(.betweenLateNightAndEarlyMorning)
            } else{
               FilterInfo.filter.arrivalTime?.append(.betweenLateNightAndEarlyMorning)
            }
        }else{
            moonImgView.tintColor = UIColor.black
            nightToEarlyMorningLbl.textColor = UIColor.black
            
            if tag == 0{
                FilterInfo.filter.departureTime=FilterInfo.filter.departureTime?.filter { (filterByIime) -> Bool in
                    return filterByIime != FilterByTime.betweenLateNightAndEarlyMorning
                }
                
            }else{
                FilterInfo.filter.arrivalTime=FilterInfo.filter.arrivalTime?.filter { (filterByIime) -> Bool in
                    return filterByIime != FilterByTime.betweenLateNightAndEarlyMorning
                }
            }
        }
        
    }
    
    
    
}
