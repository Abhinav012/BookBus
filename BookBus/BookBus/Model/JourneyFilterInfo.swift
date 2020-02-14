//
//  JourneyInfo.swift
//  BookBus
//
//  Created by Thanos on 07/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import Foundation

enum SortBy: String
{
    case cheapest = "Cheapest First"
    case bestRate = "Best Rate First"
    case earlyDeparture = "Early Departure"
    case lateDeparture = "Late Departure"
    case none = ""
}

enum FilterByTime: String{
    case betweenMorningAndNoon = "06:00-11:59"
    case betweenNoonAndEvening = "12:00-17:59"
    case betweenEveningAndNight = "18:00-23:59"
    case betweenLateNightAndEarlyMorning = "00:00-05:59"
    case none = ""
}

enum Bus: String{
    case airConditioned = "AC"
    case seater = "SEATER"
    case none = ""
}

class FilterInfo{
    
    static var filter = FilterInfo()
    
    private init(){
    
    self.sortBy = SortBy(rawValue: "")
    self.departureTime = [FilterByTime]()
    self.busTypes = [Bus]()
    self.boardingPoints = [String]()
    self.droppingPoints = [String]()
    self.busOperators = [String]()
    self.amenities = [String]()
    self.feature = [String]()
    self.arrivalTime = [FilterByTime]()
    
    }
    
    var sortBy: SortBy?
    var departureTime: [FilterByTime]?
    var busTypes: [Bus]?
    var boardingPoints: [String]?
    var droppingPoints: [String]?
    var busOperators: [String]?
    var amenities: [String]?
    var feature: [String]?
    var arrivalTime:[FilterByTime]?


}
