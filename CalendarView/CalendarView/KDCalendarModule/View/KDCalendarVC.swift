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
        calendarView.multipleSelectionEnable = true
        calendarView.marksWeekends = true
        calendarView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    }
    
}

// MARK: - Life Cycle

extension KDCalendarVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarSetup()
        
        calendarView.selectDate(Date.randomDate(range: 180))
        calendarView.selectDate(Date.randomDate(range: 180))
        calendarView.selectDate(Date.randomDate(range: 180))
        calendarView.selectDate(Date.randomDate(range: 180))
        calendarView.selectDate(Date.randomDate(range: 180))
        calendarView.selectDate(Date.randomDate(range: 180))
        calendarView.selectDate(Date.randomDate(range: 180))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}

// MARK: - CalendarView DataSource/Delegate

extension KDCalendarVC: CalendarViewDataSource, CalendarViewDelegate {
    
    func startDate() -> Date {
        return calendarHandler.startDate
    }
    
    func endDate() -> Date {
        return calendarHandler.endDate
    }
    
    func headerString(_ date: Date) -> String? {
        return calendarHandler.title(date)
    }
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
        print(self.calendarView.selectedDates)
    }
    
    func calendar(_ calendar: CalendarView, didSelectDate date: Date,
                  withEvents events: [CalendarEvent]) {}
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
        selectedDates = calendar.selectedDates
    }
    
    func calendar(_ calendar: CalendarView, didLongPressDate date: Date,
                  withEvents events: [CalendarEvent]?) {}
    
}
