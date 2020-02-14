//
//  BusDetailsViewController.swift
//  BookBus
//
//  Created by Thanos on 10/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BusDetailsViewController: UIViewController {

    var detailsArr = ["Why book this bus?", "Boarding/ Dropping", "Amenities & Photos", "Ratings & Reviews", "Booking Policies"]
    var colorArr = [#colorLiteral(red: 0.9914770722, green: 0.7174645066, blue: 0.250264585, alpha: 1), #colorLiteral(red: 0.9608513713, green: 0.325186938, blue: 0.4419691265, alpha: 1), #colorLiteral(red: 0.278817296, green: 0.7112916112, blue: 0.9759412408, alpha: 1), #colorLiteral(red: 0.3045144379, green: 0.7842772603, blue: 0.6256847382, alpha: 1), #colorLiteral(red: 0.4071704447, green: 0.5128836632, blue: 0.9508313537, alpha: 1)]
    var imageArr = [#imageLiteral(resourceName: "bus-2"), #imageLiteral(resourceName: "bus-2"), #imageLiteral(resourceName: "tick"), #imageLiteral(resourceName: "star"), #imageLiteral(resourceName: "privacy-policy")]
    
    @IBOutlet weak var busDetailsCollectionView: UICollectionView!
    @IBOutlet weak var busDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = busDetailsCollectionView.layer
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 1)
            layer.shadowOpacity = 1.0
    }

}

extension BusDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 3 || collectionView.tag == 4{
            return 1
        }
        if collectionView.tag == 1 || collectionView.tag == 2{
            return 2
        }
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
       
        
        if collectionView.tag == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewAmenitiesCell", for: indexPath)
            return cell
        }
        else if collectionView.tag == 4{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewPhotosCell", for: indexPath)
            return cell
        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusBookingCollectionViewCell", for: indexPath) as! BusBookingCollectionViewCell
        
        cell.detailLabel.text = detailsArr[indexPath.row]
        cell.detailImageView.backgroundColor = colorArr[indexPath.row]
        cell.detailImageView.image = imageArr[indexPath.row]
        cell.selectionView.backgroundColor = UIColor.clear
     
        if indexPath.row == 0{
            cell.selectionView.backgroundColor = #colorLiteral(red: 0.8467031121, green: 0.2987058163, blue: 0.3427696228, alpha: 1)
        }
        
        return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
        if collectionView.tag == 3{
            return CGSize(width: 74, height: 50)
        }
        else if collectionView.tag == 4{
            return CGSize(width: 60, height: 60)
        }
        
        return CGSize(width: self.view.frame.width/5, height: 83)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0{
            busDetailsTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
}

extension BusDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
            return 4
        }
        
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
       
        if tableView.tag == 1{
            tableView.setupBorder(with: UIColor.lightGray, width: 0.5)
           let cell = tableView.dequeueReusableCell(withIdentifier: "cancellationPolicyCell", for: indexPath)
           return cell
        }
        
       
       
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reasonCell", for: indexPath)
            return cell
            
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BoardingDroppingTableViewCell", for: indexPath) as! BoardingDroppingTableViewCell
            cell.boardingDroppingCollectionView.reloadData()
            cell.pointCollectionView.reloadData()
            cell.selectFirstIndex()
            return cell
            
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "amenitiesCell", for: indexPath)
            return cell
        }
        else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ratingReviewTableViewCell", for: indexPath)
            return cell
            
        }
        
        //bookingPoliciesCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookingPoliciesCell", for: indexPath)
        
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //219 194
        
        if tableView.tag == 1{
            return UITableView.automaticDimension
        }
        
        
        if indexPath.row == 0{
            return 194
        }
        else if indexPath.row == 1{
            return 335
        }
        else if indexPath.row == 2{
            return 219
        }
        else if indexPath.row == 3{
            return 99
        }
        
        
        return UITableView.automaticDimension
    }

   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cell1 = busDetailsTableView.visibleCells.first else { return }
        
        var indexP = busDetailsTableView.indexPath(for: cell1)
        
        for cell in busDetailsCollectionView.visibleCells as! [BusBookingCollectionViewCell]{
            let index = busDetailsCollectionView.indexPath(for: cell)
            
            if index == indexP{
                cell.selectionView.backgroundColor = #colorLiteral(red: 0.8467031121, green: 0.2987058163, blue: 0.3427696228, alpha: 1)
            }
            else{
                cell.selectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
        
        
        
        busDetailsCollectionView.selectItem(at: indexP, animated: true, scrollPosition: .right)
        
    }
}
