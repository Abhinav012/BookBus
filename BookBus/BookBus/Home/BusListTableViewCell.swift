//
//  BusListTableViewCell.swift
//  BookBus
//
//  Created by Thanos on 06/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class BusListTableViewCell: UITableViewCell {

    @IBOutlet weak var restStopsLabel: UILabel!
    @IBOutlet weak var journeyBgnTimeLbl: UILabel!
    @IBOutlet weak var journeyEndTimeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var seatsAvailableLbl: UILabel!
    @IBOutlet weak var busServiceName: UILabel!
    @IBOutlet weak var busDescription: UILabel!
    @IBOutlet weak var busStatusLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var travellers: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
