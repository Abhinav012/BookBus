//
//  PointCollectionViewCell.swift
//  BookBus
//
//  Created by Thanos on 12/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class PointCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var boardingDroppingPointSummaryTableView: UITableView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        boardingDroppingPointSummaryTableView.delegate = self
        boardingDroppingPointSummaryTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pointTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
