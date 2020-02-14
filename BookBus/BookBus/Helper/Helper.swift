//
//  Helper.swift
//  BookBus
//
//  Created by Thanos on 05/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import Foundation

var monthOfYear = ""
var abbMonth = ""

enum WeekDay: Int{
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
}

enum Month: Int{
    case jan = 1
    case feb = 2
    case mar = 3
    case apr = 4
    case may = 5
    case jun = 6
    case jul = 7
    case aug = 8
    case sep = 9
    case oct = 10
    case nov = 11
    case dec = 12
}




func setMonthOfYear(month: Month){
   
    
    switch(month){
    case .jan :
        monthOfYear = "JANUARY"
        abbMonth = "Jan"
    case .feb :
        monthOfYear = "FEBRUARY"
        abbMonth = "Feb"
    case .mar :
        monthOfYear = "MARCH"
        abbMonth = "Mar"
    case .apr :
        monthOfYear = "APRIL"
        abbMonth = "Apr"
    case .may :
        monthOfYear = "MAY"
        abbMonth = "May"
    case .jun :
        monthOfYear = "JUNE"
        abbMonth = "Jun"
    case .jul :
        monthOfYear = "JULY"
        abbMonth = "Jul"
    case .aug :
        monthOfYear = "AUGUST"
        abbMonth = "Aug"
    case .sep :
        monthOfYear = "SEPTEMBER"
        abbMonth = "Sep"
    case .oct :
        monthOfYear = "OCTOBER"
        abbMonth = "Oct"
    case .nov :
        monthOfYear = "NOVEMBER"
        abbMonth = "Nov"
    case .dec :
        monthOfYear = "DECEMBER"
        abbMonth = "Dec"
    }
}

