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
    
    public var selectedDates: [Date] = []
    
    private lazy var calendarHandler: CalendarHandler = {
        return CalendarHandler()
    }()
    
    @IBOutlet private weak var calendarView: CalendarView!
    
}

// MARK: - Methods

fileprivate extension KDCalendarVC {
    
    func calendarSetup() {
        calendarView.style = calendarHandler.style
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.direction = .vertical
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
        calendarView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        calendarView.selectDate(Date.randomDate(range: 70))
        calendarView.selectDate(Date.randomDate(range: 70))
        calendarView.selectDate(Date.randomDate(range: 70))
        calendarView.selectDate(Date.randomDate(range: 70))
        calendarView.selectDate(Date.randomDate(range: 70))
        calendarView.selectDate(Date.randomDate(range: 70))
        calendarView.selectDate(Date.randomDate(range: 70))
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
        return calendarHandler.endDate
    }
    
    func headerString(_ date: Date) -> String? {
        return calendarHandler.title(date)
    }
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
        print(self.calendarView.selectedDates)
//        self.datePicker.setDate(date, animated: true)
    }
    
    func calendar(_ calendar: CalendarView, didSelectDate date: Date, withEvents events: [CalendarEvent]) {
//        calendarView.selectDate(date)
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
//        calendarView.deselectDate(date)
    }
    
    func calendar(_ calendar: CalendarView, didLongPressDate date: Date, withEvents events: [CalendarEvent]?) {
        
    }
    
}
