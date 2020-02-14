//
//  BoardingDroppingTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 12/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BoardingDroppingTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var pointCollectionView: UICollectionView!
    @IBOutlet weak var boardingDroppingCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pointCollectionView.delegate = self
        pointCollectionView.dataSource = self
        boardingDroppingCollectionView.delegate = self
        boardingDroppingCollectionView.dataSource = self
        
        
        
    }
    
    func selectFirstIndex(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.pointCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .right)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "boardingDroppingCell", for: indexPath) as! BoardingDroppingCollectionViewCell
            
            if indexPath.row == 1{
                cell.pointLabel.text = "Dropping Point"
                
            }else{
                cell.isSelected = true
            }
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pointCollectionViewCell", for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1{
            return CGSize(width: UIScreen.main.bounds.width/2, height: 38)
        }
       
            return CGSize(width: UIScreen.main.bounds.width, height:245)
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            boardingDroppingCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
        }
    }
    


}
