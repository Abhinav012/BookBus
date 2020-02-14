//
//  ViewController.swift
//  BookBus
//
//  Created by Thanos on 28/01/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stopTxtField: UITextField!
    @IBOutlet weak var placeTableView: UITableView!
    
    var isSearchBegan = false
    var searchResult = ["Goa(All Location)", "Goa Package", "Mapusa, Goa", "Madgaon, Goa", "Panjim, Goa", "North Goa", "Porvorim, Goa", "Goa Airport", "Canacona, Goa", "South Goa"]
    var resultFiltered = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        stopTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopTxtField.attributedPlaceholder = NSAttributedString(string: "Enter bus stop or city", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
 @objc func textFieldDidChange(_ textField: UITextField) {
        
        if (stopTxtField.text?.count)!>0{
            isSearchBegan = true
            
            resultFiltered = searchResult.filter({ (str) -> Bool in
                if str.contains(stopTxtField.text!)
                {
                    return true
                }
                else{
                    return false
                }
            })
            
        }
        else{
            isSearchBegan = false
            resultFiltered = [String]()
        }
        
        placeTableView.reloadData()
        
    }
}





extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isSearchBegan{
            return 1
        }
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        if isSearchBegan{
            return ""
        }
        
        if section == 0 {
            return "Recent searches"
        }
        
        return "Top Locations"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchBegan{
            return resultFiltered.count
        }
        
        
        if section == 0 {
            return 1
        }
        
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSearchBegan{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
            
            cell.searchLabel.text = resultFiltered[indexPath.row]
            
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesTableViewCell", for: indexPath) as! PlacesTableViewCell
        
        if indexPath.section == 0{
         cell.placesCollectionView.tag = 10
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearchBegan{
            let userDefaults = UserDefaults.standard
            
           
                userDefaults.set("  "+resultFiltered[indexPath.row], forKey: "placeSelected")

            
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell1", for: indexPath) as! PlacesCollectionViewCell
        
        if indexPath.row == 1 {
           cell.placeLabel.text = "Pune"
        }
        
        
        if collectionView.tag == 10{
            cell.locationImageView.image = UIImage(named: "marker")
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2, height: 86)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userDefaults = UserDefaults.standard
        
        if indexPath.row == 1{
           userDefaults.set(" Pune", forKey: "placeSelected")
        }
        else {
            userDefaults.set(" Sangamwadi, Pune", forKey: "placeSelected")
        }
        
        self.navigationController?.popViewController(animated: true)
    }

}
