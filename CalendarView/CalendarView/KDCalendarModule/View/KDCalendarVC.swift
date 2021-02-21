//
//  KDCalendarVC.swift
//  CalendarView
//
//  Created by shndrs on 2/21/21.
//

import UIKit
import KDCalendar
import EventKit

final class KDCalendarVC: UIViewController {

    @IBOutlet private weak var calendarView: CalendarView!
    
}

// MARK: - Methods

fileprivate extension KDCalendarVC {
    
    func calendarSetup() {
        let style = CalendarView.Style()
        style.cellShape = .round//.bevel(8.0)
        style.cellColorDefault = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        style.cellColorToday = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        style.cellSelectedBorderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        style.cellEventColor = UIColor(red:1.00, green: 0.63, blue: 0.24, alpha: 1.00)
        style.cellSelectedColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        style.cellTextColorDefault = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        style.cellTextColorWeekend = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        style.headerTextColor = .black
        style.cellSelectedTextColor = .white
        style.cellColorOutOfRange = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        style.headerBackgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        style.weekdaysBackgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        style.firstWeekday = .monday
        style.calendar = Calendar(identifier: .persian)
        
        style.headerFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.cellFont = UIFont(name: "AvenirNext-Medium", size: 17.0) ?? UIFont.systemFont(ofSize: 14.0)
        style.weekdaysFont = UIFont(name: "AvenirNext-Regular", size: 14) ?? UIFont.systemFont(ofSize: 20.0)
        
        calendarView.style = style
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.direction = .vertical
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
        calendarView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    }
    
}

// MARK: - Life Cycle

extension KDCalendarVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}

// MARK: - CalendarView DataSource/Delegate

extension KDCalendarVC: CalendarViewDataSource, CalendarViewDelegate {
    
    func startDate() -> Date {
        return Date()
    }
    
    func endDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = 12
        let today = Date()
        let twoYearsFromNow = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
        return twoYearsFromNow
    }
    
    func headerString(_ date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "fa_IR")
        let myString = formatter.string(from: date) // string purpose I add here
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MMM - yyyy"
        let dateString = formatter.string(from: yourDate!)
        return dateString
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
