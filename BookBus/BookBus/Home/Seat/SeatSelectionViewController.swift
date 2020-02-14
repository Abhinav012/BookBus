//
//  SeatSelectionViewController.swift
//  BookBus
//
//  Created by Thanos on 08/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class SeatSelectionViewController: UIViewController {

    @IBOutlet weak var selectionCollectionView: UICollectionView!
    
    @IBOutlet weak var upperSeatSelectionCollectionView: UICollectionView!
    @IBOutlet weak var travelDetailsView: UIView!
    
    @IBOutlet weak var travelDetailsViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var colectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollContentViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var upperCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lowerUpperControl: UISegmentedControl!
    var busType = "seater"
    
    
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var firstPriceBtn: UIButton!
    @IBOutlet weak var secondPriceBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        travelDetailsView.layer.borderColor = UIColor.lightGray.cgColor
        travelDetailsView.layer.borderWidth = 1
        travelDetailsView.layer.cornerRadius = 10
        travelDetailsViewBottomConstraint.constant = 50-self.view.frame.height
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
         panGesture.delegate = self
         self.view.addGestureRecognizer(panGesture)
        
        let travelDetailViewGesture = UIPanGestureRecognizer(target: self, action: #selector(travelDetailsViewGestureAction(_:)))
        travelDetailsView.addGestureRecognizer(travelDetailViewGesture)
        
        selectionCollectionView.reloadData()
        
        let height = selectionCollectionView.collectionViewLayout.collectionViewContentSize.height
        colectionViewHeightConstraint.constant = height
        upperCollectionViewHeightConstraint.constant = height
        scrollContentViewHeightConstraint.constant = height+1068-880
        self.view.layoutIfNeeded()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if busType == "seater"{
            lowerUpperControl.isHidden = true
        }
        else {
            lowerUpperControl.isHidden = false
        }
        
        allBtn.backgroundColor = UIColor.themeRed
        allBtn.setTitleColor(UIColor.white, for: .normal)
        
        firstPriceBtn.setupBorder(with: UIColor.themeRed, width: 1)
        firstPriceBtn.setTitleColor(UIColor.themeRed, for: .normal)
        secondPriceBtn.setupBorder(with: UIColor.themeRed, width: 1)
        secondPriceBtn.setTitleColor(UIColor.themeRed, for: .normal)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "BusDetailsViewController") as! BusDetailsViewController
        
        self.addChild(vc)
        travelDetailsView.clipsToBounds = true
        travelDetailsView.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.leftAnchor.constraint(equalTo: travelDetailsView.leftAnchor).isActive = true
        vc.view.rightAnchor.constraint(equalTo: travelDetailsView.rightAnchor).isActive = true
        vc.view.topAnchor.constraint(equalTo: travelDetailsView.topAnchor).isActive = true
        vc.view.bottomAnchor.constraint(equalTo: travelDetailsView.bottomAnchor).isActive = true
        self.view.layoutIfNeeded()
    }
    
    @objc func panGestureAction(_ sender: UIPanGestureRecognizer){
    
        let translation = sender.translation(in: sender.view)
        navBarHeightConstraint.constant += translation.y
        sender.setTranslation(.zero, in: sender.view)
    }
    
    @objc func travelDetailsViewGestureAction(_ sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: sender.view)
        let velocity = sender.velocity(in: sender.view)
        
        switch sender.state{
        case .began, .changed:
            travelDetailsViewBottomConstraint.constant -= translation.y
            sender.setTranslation(.zero, in: sender.view)
        case .ended:
            
            if velocity.y >= 20{
                self.travelDetailsViewBottomConstraint.constant = 50-self.view.frame.height
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }
            else if travelDetailsViewBottomConstraint.constant >= (50-self.view.frame.height)/2{
                self.travelDetailsViewBottomConstraint.constant = -120
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }else{
                self.travelDetailsViewBottomConstraint.constant = 50-self.view.frame.height
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }
            
            break
        case .cancelled:
             self.travelDetailsViewBottomConstraint.constant = 50-self.view.frame.height
            UIView.animate(withDuration: 0.3) {
               self.view.layoutIfNeeded()
            }
        case .possible:
            break
        case .failed:
            break
        }
        
        
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func selectLowerUpper(_ sender: Any) {
        
        if lowerUpperControl.selectedSegmentIndex == 0{
            upperSeatSelectionCollectionView.isHidden = true
            selectionCollectionView.isHidden = false
        }
        else{
            upperSeatSelectionCollectionView.isHidden = false
            selectionCollectionView.isHidden = true
        }
    }
    @IBAction func allBtnAction(_ sender: Any) {
        allBtn.backgroundColor = UIColor.themeRed
        allBtn.setTitleColor(UIColor.white, for: .normal)
        
        firstPriceBtn.setupBorder(with: UIColor.themeRed, width: 1)
        firstPriceBtn.setTitleColor(UIColor.themeRed, for: .normal)
        secondPriceBtn.setupBorder(with: UIColor.themeRed, width: 1)
        secondPriceBtn.setTitleColor(UIColor.themeRed, for: .normal)
        
        secondPriceBtn.backgroundColor = UIColor.white
        firstPriceBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func firstPriceBtnAction(_ sender: Any) {
        firstPriceBtn.backgroundColor = UIColor.themeRed
        firstPriceBtn.setTitleColor(UIColor.white, for: .normal)
        allBtn.setupBorder(with: UIColor.themeRed, width: 1)
        allBtn.setTitleColor(UIColor.themeRed, for: .normal)
        allBtn.backgroundColor = UIColor.white
        secondPriceBtn.setupBorder(with: UIColor.themeRed, width: 1)
        secondPriceBtn.setTitleColor(UIColor.themeRed, for: .normal)
        secondPriceBtn.backgroundColor = UIColor.white
    }
    
    
    @IBAction func secondPriceBtn(_ sender: Any) {
        secondPriceBtn.backgroundColor = UIColor.themeRed
        secondPriceBtn.setTitleColor(UIColor.white, for: .normal)
        allBtn.setupBorder(with: UIColor.themeRed, width: 1)
        allBtn.setTitleColor(UIColor.themeRed, for: .normal)
        firstPriceBtn.setupBorder(with: UIColor.themeRed, width: 1)
        firstPriceBtn.setTitleColor(UIColor.themeRed, for: .normal)
        allBtn.backgroundColor = UIColor.white
        firstPriceBtn.backgroundColor = UIColor.white
    }
    
}

extension SeatSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if busType == "seater"{
          return 90
        }
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.layer.borderColor = UIColor.black.cgColor
        collectionView.layer.borderWidth = 1
        
        if busType == "seater"{
        
        if indexPath.row<=3 || (indexPath.row-2)%5 == 0 && indexPath.row != 87{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emptyCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 4{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wheelCell", for: indexPath)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCollectionViewCell
        return cell
        }
        
        if  (indexPath.row-1)%4 == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emptyCell", for: indexPath)
            return cell
        }
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sleeperCell", for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if busType == "seater"{
        return CGSize(width: 48, height: 48)
        }
        return CGSize(width: 60, height: 96)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !(indexPath.row<=3) && indexPath.row != 4 && !((indexPath.row-2)%5 == 0 && indexPath.row != 87) && busType == "seater" {
            let cell = collectionView.cellForItem(at: indexPath) as! SeatCollectionViewCell
            cell.updateImage()
        }
        else if busType == "sleeper" && (indexPath.row-1)%4 != 0{
            let cell = collectionView.cellForItem(at: indexPath) as! SleeperCollectionViewCell
           cell.updatebearthSelection()
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if !(indexPath.row<=3 || (indexPath.row-2)%5 == 0 && indexPath.row != 87) || indexPath.row != 4{
//            let cell = collectionView.cellForItem(at: indexPath) as! SeatCollectionViewCell
//            cell.updateImage()
//        }
//     
//    }
    
}

extension SeatSelectionViewController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
