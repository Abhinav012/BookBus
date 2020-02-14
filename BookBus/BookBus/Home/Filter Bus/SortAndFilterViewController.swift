//
//  SortAndFilterViewController.swift
//  BookBus
//
//  Created by Thanos on 07/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class SortAndFilterViewController: UIViewController {
    var option = ["BOARDING POINT", "DROPPING POINT", "BUS OPERATOR", "AMENITIES"]
    var moreFeatures = ["Live Tracking", "Red Deals", "High Rated Buses", "Reschedule"]
    var featureImages = ["bus", "deal", "bus", "schedule"]
    var shouldClearFilterData = false
    @IBOutlet weak var navBarView: UIView!
    
    @IBOutlet weak var filterAndSortTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    navBarView.backgroundColor = UIColor.themeRed
    }
    
    
    @IBAction func clearFilterData(_ sender: Any) {
    let filter = FilterInfo.filter
        filter.amenities = nil
        filter.arrivalTime = nil
        filter.boardingPoints = nil
        filter.busOperators = nil
        filter.busTypes = nil
        filter.departureTime = nil
        filter.droppingPoints = nil
        filter.feature = nil
        filter.sortBy = nil
        
        DispatchQueue.main.async {
          self.filterAndSortTableView.reloadData()
        }
        
       
        
    }
    
    @IBAction func applyFilter(_ sender: Any) {
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension SortAndFilterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SortByTableViewCell", for: indexPath) as! SortByTableViewCell
            
            if FilterInfo.filter.sortBy == nil{
                cell.cheapestOptionBtn.setTitleColor(UIColor.black, for: .normal)
                cell.bestRatedOptionBtn.setTitleColor(UIColor.black, for: .normal)
                cell.earlyDepartureOptionBtn.setTitleColor(UIColor.black, for: .normal)
                cell.lateDepartureBtn.setTitleColor(UIColor.black, for: .normal)
                cell.cheapestOptionImgView.image = UIImage(named: "unchecked-radio-button")
                cell.bestRatedOptionImgView.image = UIImage(named: "unchecked-radio-button")
                cell.earlyDepOptionImgView.image = UIImage(named: "unchecked-radio-button")
                cell.lateDepartureOptionImgView.image = UIImage(named: "unchecked-radio-button")
            }
            
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterByTableViewCell", for: indexPath) as! FilterByTableViewCell
            
            if FilterInfo.filter.departureTime == nil{
                cell.sunRiseImgView.tintColor = UIColor.black
                cell.sunImgView.tintColor = UIColor.black
                cell.sunsetImgView.tintColor = UIColor.black
                cell.moonImgView.tintColor = UIColor.black
                cell.morningLbl.textColor = UIColor.black
                cell.noonToEveLbl.textColor = UIColor.black
                cell.eveToLateNightLbl.textColor = UIColor.black
                cell.nightToEarlyMorningLbl.textColor = UIColor.black
            }
            
            return cell
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BusTypeTableViewCell", for: indexPath) as! BusTypeTableViewCell
            
            if FilterInfo.filter.busTypes == nil{
                cell.seaterImgView.tintColor = UIColor.black
                cell.seaterLbl.textColor = UIColor.black
                cell.acImgView.tintColor = UIColor.black
                cell.acLbl.textColor = UIColor.black
            }
            
            return cell
        }
        else if indexPath.row >= 3 && indexPath.row<=6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SortAndFilterTableViewCell", for: indexPath) as! SortAndFilterTableViewCell
            cell.optionLabel.text = option[indexPath.row-3]
            return cell
        }
        else if indexPath.row == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
        else if indexPath.row >= 8 && indexPath.row<=11 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureTableViewCell", for: indexPath) as! FeatureTableViewCell
            cell.featureLbl.text = moreFeatures[indexPath.row-8]
            cell.featureImgView.image = UIImage(named: featureImages[indexPath.row-8])
            
            if FilterInfo.filter.feature == nil{
                cell.featureSelectionBtn.setImage(UIImage(named: "unchecked-checkbox"), for: .normal)
            }
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterByTableViewCell2", for: indexPath) as! FilterByTableViewCell
        
        if FilterInfo.filter.arrivalTime == nil {
            cell.sunRiseImgView.tintColor = UIColor.black
            cell.sunImgView.tintColor = UIColor.black
            cell.sunsetImgView.tintColor = UIColor.black
            cell.moonImgView.tintColor = UIColor.black
            cell.morningLbl.textColor = UIColor.black
            cell.noonToEveLbl.textColor = UIColor.black
            cell.eveToLateNightLbl.textColor = UIColor.black
            cell.nightToEarlyMorningLbl.textColor = UIColor.black
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 220
        }
        else if indexPath.row == 1{
            return 195
        }
        else if indexPath.row == 2{
            return 126
        }
        else if indexPath.row >= 3 && indexPath.row<=7{
            return 53
        }
        else if indexPath.row >= 8 && indexPath.row<=11{
            return 44
        }
        
        return 195
    }
}

