//
//  BusListViewController.swift
//  BookBus
//
//  Created by Thanos on 06/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BusListViewController: UIViewController {

    @IBOutlet weak var ratedBusImgView: UIImageView!
    @IBOutlet weak var eveningBusesImgView: UIImageView!
    @IBOutlet weak var seaterImgView: UIImageView!
    @IBOutlet weak var acImgView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ratedBusImgView.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        eveningBusesImgView.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        seaterImgView.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        acImgView.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
    @IBAction func filterJourneyOptions(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SortAndFilterViewController") as! SortAndFilterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension BusListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusListTableViewCell", for: indexPath) as! BusListTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if indexPath.row == 0{
        return 44
        }
        
        return 182
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //SeatSelectionViewController
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SeatSelectionViewController") as! SeatSelectionViewController
        if indexPath.row == 1{
            vc.busType = "seater"
        }
        else{
            vc.busType = "sleeper"
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
