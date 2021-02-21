//
//  KDCalendarVC.swift
//  CalendarView
//
//  Created by shndrs on 2/21/21.
//

import UIKit
import KDCalendar

final class KDCalendarVC: UIViewController {

    @IBOutlet private weak var calendarView: CalendarView! {
        didSet {
            calendarSetup()
            calendarView.dataSource = self
            calendarView.delegate = self
            calendarView.direction = .horizontal
            calendarView.multipleSelectionEnable = false
            calendarView.marksWeekends = true
            calendarView.backgroundColor = UIColor(red: 252/255, green: 252/255,
                                                   blue: 252/255, alpha: 1.0)
        }
    }
    
}

// MARK: - Methods

fileprivate extension KDCalendarVC {
    
    func calendarSetup() {
        let style = CalendarView.Style()
        style.cellShape = .bevel(8.0)
        style.cellColorDefault = UIColor.clear
        style.cellColorToday = UIColor(red:1.00, green:0.84, blue:0.64, alpha:1.00)
        style.cellSelectedBorderColor = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.cellEventColor = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.headerTextColor = UIColor.gray
        style.cellTextColorDefault = UIColor(red: 249/255, green: 180/255, blue: 139/255, alpha: 1.0)
        style.cellTextColorToday = UIColor.orange
        style.cellTextColorWeekend = UIColor(red: 237/255, green: 103/255, blue: 73/255, alpha: 1.0)
        style.cellColorOutOfRange = UIColor(red: 249/255, green: 226/255, blue: 212/255, alpha: 1.0)
        style.headerBackgroundColor = UIColor.white
        style.weekdaysBackgroundColor = UIColor.white
        style.firstWeekday = .monday
        style.locale = Locale(identifier: "fa_IR")
        style.cellFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.headerFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.weekdaysFont = UIFont(name: "Helvetica", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        calendarView.style = style
    }
    
}

// MARK: - Life Cycle

extension KDCalendarVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - CalendarView DataSource/Delegate

extension KDCalendarVC: CalendarViewDataSource, CalendarViewDelegate {
    
    func startDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = -1
        let today = Date()
        let threeMonthsAgo = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        return threeMonthsAgo
    }
    
    func endDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = 12
        let today = Date()
        let twoYearsFromNow = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        return twoYearsFromNow
    }
    
    func headerString(_ date: Date) -> String? {
        return "SHNDRS"
    }
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
        print(self.calendarView.selectedDates)
//        self.datePicker.setDate(date, animated: true)
    }
    
    func calendar(_ calendar: CalendarView, didSelectDate date: Date, withEvents events: [CalendarEvent]) {
        
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
        
    }
    
    func calendar(_ calendar: CalendarView, didLongPressDate date: Date, withEvents events: [CalendarEvent]?) {
        
    }
    
}
