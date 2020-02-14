//
//  HomeViewController.swift
//  BookBus
//
//  Created by Thanos on 28/01/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let bookingOptionsImages = ["bus", "food", "packages", "recharge", "pool"]
    let bookingOptions = ["Bus Hire", "Food & Fun", "Packages", "Recharges", "rPool"]
    
    @IBOutlet weak var sourceView: UIView!
    @IBOutlet weak var destinationView: UIView!
    
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    @IBOutlet weak var couponCollectionView: UICollectionView!
    @IBOutlet weak var optionsShortCollectionView: UICollectionView!
    
    
    @IBOutlet weak var interChangeSourceAndDestinationBtn: UIButton!
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var destinationTxtField: UITextField!
    @IBOutlet weak var destinationPlcHldImageView: UIImageView!
    @IBOutlet weak var selectJourneyDateBtn: UIButton!
    @IBOutlet weak var todayBtn: UIButton!
    @IBOutlet weak var tomorrowBtn: UIButton!
    
    @IBOutlet weak var seprator1View: UIView!
    @IBOutlet weak var seprator2View: UIView!
    @IBOutlet weak var seprator3View: UIView!
    
    @IBOutlet weak var heightConstraintSearchView: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintSearchContainerView: NSLayoutConstraint!
    @IBOutlet weak var optionsLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchShortBtnHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var searchShortButton: UIButton!
    @IBOutlet weak var sourceBtn: UIButton!
    
    @IBOutlet weak var sourceField: UITextField!
    
    @IBOutlet weak var destinationField: UITextField!
    
    var startLocation: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        optionsCollectionView.register(UINib(nibName: "OptionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "optionsCell")
        optionsShortCollectionView.register(UINib(nibName: "OptionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "optionsCell")
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        self.view.addGestureRecognizer(panGesture)
         //startLocation = panGesture.location(in: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //userDefaults.set("Pune", forKey: "placeSelected")
        
        let userDefaults = UserDefaults.standard
        
        guard let place = userDefaults.value(forKey: "placeSelected") else {
            return
        }
        
        
        if userDefaults.value(forKey: "ButtonTapped") as! Int == 1 {
            sourceField.text = place as! String
        }else if userDefaults.value(forKey: "ButtonTapped") as! Int == 2 {
           destinationField.text = place as! String
        }
        
        userDefaults.set(nil, forKey: "placeSelected")
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startLocation = touches.first?.location(in: self.view)
    }
    
    
    func setupUI(){
        optionsCollectionView.layer.backgroundColor = UIColor.clear.cgColor
        optionsShortCollectionView.layer.backgroundColor = UIColor.clear.cgColor
        couponCollectionView.layer.backgroundColor = UIColor.clear.cgColor
        interChangeSourceAndDestinationBtn.layer.cornerRadius = interChangeSourceAndDestinationBtn.frame.width/2
        searchContainerView.backgroundColor = UIColor.themeRed
        searchButton.backgroundColor = UIColor.themeRed
        searchShortButton.layer.cornerRadius = searchShortButton.frame.width/2
    }
    
  @objc func panGestureAction(_ sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: sender.view)
    
    
    switch sender.state {
    
    case .began, .changed:
        
        DispatchQueue.main.async {

            
            
            
        if translation.y < 0 {
            
            sender.setTranslation(.zero, in: sender.view)
            self.heightConstraintSearchContainerView.constant += translation.y
            
            if  self.searchView.frame.height > 232*3/4 {
                
                self.hideDestinationSegmentAndInterchangeButton(translation: translation)

            } else if self.searchView.frame.height > 232*1/2{
              
                let constraint1 = (self.searchContainerView.frame.height-136-58)/116
                self.selectJourneyDateBtn.alpha = constraint1
                self.todayBtn.alpha = constraint1
                self.tomorrowBtn.alpha = constraint1
                self.seprator2View.alpha = (self.searchContainerView.frame.height-136-2*58)/58
                self.seprator3View.alpha = constraint1

           
            }
            else if self.searchView.frame.height > 232*1/4{
                self.searchButton.alpha = (self.searchContainerView.frame.height-136-58)/116
                self.searchShortButton.isHidden = false
                self.searchShortBtnHeightConstraint.constant  = (310-self.searchContainerView.frame.height)/(1.25*4)
                self.searchShortButton.layer.cornerRadius = self.searchShortButton.frame.width/2
               
             
            }
            else if self.optionsLabelTopConstraint.constant >= (23-175){
                    self.optionsLabelTopConstraint.constant += translation.y

               if self.optionsLabelTopConstraint.constant <= (23-175)/2 {
                            self.optionsCollectionView.alpha = 1-self.optionsLabelTopConstraint.constant/(23-175)
                            self.optionsShortCollectionView.alpha = self.optionsLabelTopConstraint.constant/(23-175)
                }

                            }


        }
        else{
                sender.setTranslation(.zero, in: sender.view)
           
            if  self.optionsLabelTopConstraint.constant < 23{
                self.optionsLabelTopConstraint.constant += translation.y

                if self.optionsLabelTopConstraint.constant >= (23-175)/2 && self.optionsLabelTopConstraint.constant<=0{
                    self.optionsCollectionView.alpha = 1-(self.optionsLabelTopConstraint.constant/(23-175))*2
                    self.optionsShortCollectionView.alpha = (self.optionsLabelTopConstraint.constant/(23-175))*2
                }

            }else
            {
                
                self.heightConstraintSearchContainerView.constant += translation.y


                if self.searchContainerView.frame.height-136 <= 58*2 {
                   
                    self.searchButton.alpha = ((self.searchContainerView.frame.height-136-58)/116)
                    self.searchShortBtnHeightConstraint.constant = (310-self.searchContainerView.frame.height)/(1.25*4)
                    self.searchShortButton.layer.cornerRadius = self.searchShortButton.frame.height/2
                  
                }
                else if self.searchContainerView.frame.height-136 < 232*3/4{
                    self.searchShortButton.isHidden = true
                    
                    self.selectJourneyDateBtn.alpha = (self.searchContainerView.frame.height-136-58)/116
                    self.todayBtn.alpha = ((self.searchContainerView.frame.height-136-58)/116)
                    self.tomorrowBtn.alpha = (self.searchContainerView.frame.height-136-58)/116
                    self.seprator2View.alpha = (self.searchContainerView.frame.height-136-58)/58
                    self.seprator3View.alpha = (self.searchContainerView.frame.height-136-58)/116

                  
                }else if self.searchView.frame.height <= 232 {
                    self.hideDestinationSegmentAndInterchangeButton(translation: translation)
                 
                }

            }

        }


        }
        
        
    case .ended:
        
        print(self.searchContainerView.frame.height-136)
        
        if self.searchContainerView.frame.height - 136 == 3*58 {
            self.searchButton.alpha = 1
        }
        
         if  self.optionsLabelTopConstraint.constant >= 23 {
            self.optionsShortCollectionView.alpha = 0
            self.optionsCollectionView.alpha = 1
        }
        
        if self.optionsLabelTopConstraint.constant < 23-175 && self.searchContainerView.frame.height == 136 {
            self.optionsLabelTopConstraint.constant = 23-175
        }
        
        
        break
    case .possible:
        break
    case .cancelled:
        break
    case .failed:
        break
    }
    
    self.view.layoutIfNeeded()
    self.searchView.layoutIfNeeded()
    self.interChangeSourceAndDestinationBtn.layoutIfNeeded()
    if self.searchView.frame.height < 179{
        self.interChangeSourceAndDestinationBtn.isHidden = true
    } else {
        self.interChangeSourceAndDestinationBtn.isHidden = false
    }
    
    self.interChangeSourceAndDestinationBtn.layer.cornerRadius = self.interChangeSourceAndDestinationBtn.frame.width/2
    
}
    
    func hideDestinationSegmentAndInterchangeButton(translation: CGPoint){
    
        destinationTxtField.alpha = (self.heightConstraintSearchContainerView.constant-136-2*58)/58
        
    
        destinationPlcHldImageView.alpha = (self.heightConstraintSearchContainerView.constant-136-2*58)/58
        seprator1View.alpha = (self.heightConstraintSearchContainerView.constant-136-2*58)/58
    }
    
    
    @IBAction func selectSourceTapped(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        defaults.set(1, forKey: "ButtonTapped")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func selectDestinationTapped(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(2, forKey: "ButtonTapped")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func selectJourneyDateTapped(_ sender: Any) {
        //SelectJourneyDateViewController
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectJourneyDateViewController") as! SelectJourneyDateViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func startSearch(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BusListViewController") as! BusListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 2 {
        return 4
        }
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CouponCollectionViewCell", for: indexPath) as! CouponCollectionViewCell
            
            return cell
        }
        
        
      
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "optionsCell", for: indexPath) as! OptionsCollectionViewCell
            
            cell.optionalLabel.text = bookingOptions[indexPath.row]
            cell.OptionalImageView.image = UIImage(named: bookingOptionsImages[indexPath.row])
            cell.layer.backgroundColor = UIColor.white.cgColor
        
        if collectionView.tag == 0 {
            
            cell.layer.cornerRadius = 5
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 1, height: 1)
            cell.layer.shadowRadius = 5
            cell.layer.shadowOpacity = 1.0
        }else{
            cell.optionalLabel.font = UIFont.systemFont(ofSize: 11)
        }
        
        
        return cell

            
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1{
            return CGSize(width: self.view.frame.width*2/3, height: 128)
        }
        else if collectionView.tag == 2 {
        return CGSize(width: (self.view.frame.width-3)/4, height: 64)
        }
        
        return CGSize(width: (self.view.frame.width-90)/3, height: 82)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 2 {
            return 1
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView.tag == 1{
            return 8
        }
        
        if collectionView.tag == 2 {
            return 1
        }
        
        return 20
    }
}
