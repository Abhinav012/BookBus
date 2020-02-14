//
//  SelectJourneyDateViewController.swift
//  BookBus
//
//  Created by Thanos on 05/02/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import UIKit

class SelectJourneyDateViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var daysCollectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var tomorrowLabel: UILabel!
    @IBOutlet weak var tomorrowDateLabel: UILabel!
    
    
    var daysArr = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"]
    var dateArr = [Int]()
    var startValueForCollectionView = 0
    var lastMonthLastDay = 0
    var currentMonthFirstDay = 0
    var daysInCurrentMonth = 0
    var remainingDays = 0
    var month = 0
    var numberOfDays = 35
    var todayDate = 0
    var indexPath = IndexPath(row: 0, section: 0)
    var count = 12
    var weekdayNum = 0
    var lastTranslation: CGFloat = 0
    var startingScrollingOffset: CGPoint = .zero
    var cellWidth: CGFloat = 0
    var page: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        setupCalender(month: month)
        updateDateLabel(month: month)
        cellWidth = containerView.frame.width
        setupTodayAndTomorrowBtn()
    }
    
    func setupTodayAndTomorrowBtn(){
        let calender = Calendar(identifier: .gregorian)
        let dateComponents = calender.dateComponents([.day, .year, .month], from: Date())
        setMonthOfYear(month: Month(rawValue: dateComponents.month!)!)
        todayDate = dateComponents.day!
        todayDateLabel.text = "\(dateComponents.day!) \(abbMonth),\(dateComponents.year!-2000)"
        
        let tomorrowDateComp = calender.dateComponents([.day,.year, .month], from: calender.date(byAdding: .day, value: 1, to: Date())!)
        setMonthOfYear(month: Month(rawValue: tomorrowDateComp.month!)!)
        tomorrowDateLabel.text = "\(tomorrowDateComp.day!) \(abbMonth),\(tomorrowDateComp.year!-2000)"
    }
    
    func setupUI(){
        containerView.layer.cornerRadius = 3
        containerView.backgroundColor = UIColor.white
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowOpacity = 1.0
    }
    
    func setupCalender(month: Int?){
       
        
        let calender = Calendar(identifier: .gregorian)
        let date = calender.date(byAdding: .month, value: month!, to: Date())!
        let dateComponent = calender.dateComponents([.day,.year, .month], from: date)
        let range = calender.range(of: .day, in: .month, for: date)
        daysInCurrentMonth = (range?.last)! - (range?.first)! + 1
        //print(d)
        
        let startingDate = calender.date(byAdding: .day, value: 1-dateComponent.day!, to: date)
        let startingDateDateComponents = calender.dateComponents([.weekday,.day], from: startingDate!)
        let lastMonthLastDate = calender.date(byAdding: .day, value: -dateComponent.day!, to: date)
        
        lastMonthLastDay = calender.component(.day, from: lastMonthLastDate!)
        
        let weekday = WeekDay(rawValue: startingDateDateComponents.weekday!)!
        
        
        switch(weekday){
        case .monday :
            weekdayNum = 1
        case .tuesday:
            weekdayNum = 2
        case .wednesday:
            weekdayNum = 3
        case .thursday:
            weekdayNum = 4
        case .friday:
            weekdayNum = 5
        case .saturday:
            weekdayNum = 6
        case .sunday:
            weekdayNum = 7
        }
        
        startValueForCollectionView = lastMonthLastDay-weekdayNum+2
        
        if daysInCurrentMonth + weekdayNum - 2 >= 35 {
            numberOfDays = 42
        }
        else if daysInCurrentMonth + weekdayNum - 2 <= 27 {
            numberOfDays = 28
        }
        else{
            numberOfDays = 35
        }
        
        
        
    }
    
    func updateDateLabel(month:Int){
        let calender = Calendar(identifier: .gregorian)
        let date = calender.date(byAdding: .month, value: month, to: Date())!
        let dateComponent = calender.dateComponents([.day,.year, .month], from: date)
        setMonthOfYear(month: Month(rawValue: dateComponent.month!)!)
        
        DispatchQueue.main.async {
            self.monthLabel.text = "\(monthOfYear) \(dateComponent.year!)"
        }
    }
    
    @IBAction func nextMonthBtnTapped(_ sender: Any) {
        
         month = month+1
        updateDateLabel(month: month)
        indexPath = IndexPath(item: month, section: 0)
        self.daysCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    
    @IBAction func backMonthBtnTapped(_ sender: Any) {
        
        if month > 0 {
        month = month-1
        }

        updateDateLabel(month: month)
        indexPath = IndexPath(item: month, section: 0)
        self.daysCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    
    @IBAction func todayDateSelected(_ sender: Any) {
        todayLabel.textColor = UIColor.themeRed
        todayDateLabel.textColor =  UIColor.black
        
        tomorrowLabel.textColor = UIColor.appBackgroundColor
        tomorrowDateLabel.textColor = UIColor.appBackgroundColor
    }
    
    @IBAction func tomorrowDateSelected(_ sender: Any) {
        todayLabel.textColor = UIColor.appBackgroundColor
        todayDateLabel.textColor =  UIColor.appBackgroundColor
        
        tomorrowLabel.textColor = UIColor.themeRed
        tomorrowDateLabel.textColor = UIColor.black
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SelectJourneyDateViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return daysArr.count
        }
        else if collectionView.tag == 2{
            return count
        }
        
        return numberOfDays
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysCollectionViewCell", for: indexPath) as! DaysCollectionViewCell
            cell.dayLabel.text = daysArr[indexPath.row]
            return cell
        
        }else if collectionView.tag == 2{
            
            
            setupCalender(month: indexPath.row)
            currentMonthFirstDay = 0
            remainingDays = 0
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysColContainerCollectionViewCell", for: indexPath) as! DaysColContainerCollectionViewCell
            cell.daysCollectionView.reloadData()
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as! DateCollectionViewCell
     
        if lastMonthLastDay >= startValueForCollectionView{
            cell.dateLabel.text = "\(startValueForCollectionView)"
             cell.dateLabel.textColor = UIColor(displayP3Red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
            startValueForCollectionView += 1
        }
        else if currentMonthFirstDay < daysInCurrentMonth{
            currentMonthFirstDay += 1
        
            cell.dateLabel.text = "\(currentMonthFirstDay)"
            cell.dateLabel.backgroundColor = UIColor.appBackgroundColor
            cell.dateLabel.textColor = UIColor.black
            
            if currentMonthFirstDay < todayDate && month==0{
               
                cell.dateLabel.textColor = UIColor(displayP3Red: 164/255, green: 164/255, blue: 161/255, alpha: 1)
            }
            
            
            if currentMonthFirstDay == todayDate && month == 0{
               // collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
                self.indexPath = indexPath
                cell.dateLabel.backgroundColor = UIColor.themeRed
                cell.dateLabel.textColor = UIColor.white
            }
            else{
               // collectionView.deselectItem(at: indexPath, animated: true)
                
            }
            
            
        }
        else {
            remainingDays += 1
            cell.dateLabel.text = "\(remainingDays)"
            cell.dateLabel.textColor = UIColor(displayP3Red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1{
            return CGSize(width: (containerView.frame.width-2)/7-1, height: (containerView.frame.width-2)/7-1)
        }
        else if collectionView.tag == 2{
            return CGSize(width: containerView.frame.width, height: 400)
        }
        
        
        
        return CGSize(width: containerView.frame.width/7-1, height: 34)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            
            let cell = collectionView.cellForItem(at: indexPath) as! DateCollectionViewCell
            
            
            if cell.dateLabel.textColor! == UIColor.black{
                cell.dateLabel.backgroundColor = UIColor.themeRed
                self.indexPath = indexPath
                cell.dateLabel.textColor = UIColor.white
                
            }
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            let cell = collectionView.cellForItem(at: indexPath) as! DateCollectionViewCell
            cell.dateLabel.backgroundColor = UIColor.appBackgroundColor
            
            if indexPath.row > weekdayNum - 3 + todayDate && indexPath.row<=daysInCurrentMonth+weekdayNum-2{
            cell.dateLabel.textColor = UIColor.black
            }
            else if indexPath.row > daysInCurrentMonth+weekdayNum-2 || indexPath.row<=weekdayNum-2{
            cell.dateLabel.textColor = UIColor(displayP3Red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
            }
            else if indexPath.row>weekdayNum-2 && indexPath.row<todayDate+weekdayNum-2{
            cell.dateLabel.textColor = UIColor(displayP3Red: 164/255, green: 164/255, blue: 161/255, alpha: 1)
            }
            else{
                let cell = collectionView.cellForItem(at: self.indexPath) as! DateCollectionViewCell
                cell.dateLabel.backgroundColor = UIColor.themeRed
                cell.dateLabel.textColor = UIColor.white
            }
            
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        if collectionView.tag == 2 {

        
            
            if (indexPath.row + 1) % 12 == 0 {
                count+=12
                DispatchQueue.main.async {
                    self.daysCollectionView.reloadData()
                }
            }
            
        }
        
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startingScrollingOffset = scrollView.contentOffset
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offset = scrollView.contentOffset.x + scrollView.contentInset.left // 2
        let proposedPage = offset / max(1, cellWidth)
        let snapPoint: CGFloat = 0.3
        let snapDelta: CGFloat = offset > startingScrollingOffset.x ? (1 - snapPoint) : snapPoint
        
        if floor(proposedPage + snapDelta) == floor(proposedPage) { // 3
            page = floor(proposedPage) // 4
        }
        else {
            page = floor(proposedPage + 1) // 5
        }
        
        targetContentOffset.pointee = CGPoint(
            x: cellWidth * page,
            y: targetContentOffset.pointee.y
        )
        
        month = Int(page)
        updateDateLabel(month: month)
    }
    
}
