//
//  CalendarHandler.swift
//  CalendarView
//
//  Created by shndrs on 2/21/21.
//

import KDCalendar

final class CalendarHandler: NSObject {
    
    private lazy var calendar: Calendar = {
        var cal = Calendar(identifier: .persian)
        cal.timeZone = TimeZone(identifier: "UTC")!
        cal.locale = Locale(identifier: "fa_IR")
        return cal
    }()
    
    public var style: CalendarView.Style {
        get {
            let style = CalendarView.Style()
            style.cellShape = .round
            style.cellColorDefault = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
            style.cellSelectedColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
            style.cellColorToday = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            style.cellSelectedBorderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            style.cellEventColor = UIColor(red: 1.00, green: 0.63, blue: 0.24, alpha: 1.00)
            style.cellTextColorDefault = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            style.cellTextColorWeekend = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            style.headerTextColor = .black
            style.cellSelectedTextColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            style.cellColorOutOfRange = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            style.headerBackgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            style.weekdaysBackgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            style.firstWeekday = .monday
//            style.locale = Locale(identifier: "fa_IR")
            style.calendar = self.calendar
            style.headerFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
            style.cellFont = UIFont(name: "AvenirNext-Medium", size: 17.0) ?? UIFont.systemFont(ofSize: 14.0)
            style.weekdaysFont = UIFont(name: "AvenirNext-Regular", size: 14) ?? UIFont.systemFont(ofSize: 20.0)
            return style
        }
    }
    public var startDate: Date {
        get {
            return Date()
        }
    }
    public var endDate: Date {
        get {
            var dateComponents = DateComponents()
            dateComponents.month = 48
            let endDate = self.calendar.date(byAdding: dateComponents, to: Date())!
            return endDate
        }
    }
    
    override init() {}
    
}

// MARK: - Methods

extension CalendarHandler {
    
    public func title(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "fa_IR")
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MMM / yyyy"
        let dateString = formatter.string(from: yourDate!)
        return dateString
    }
    
}
