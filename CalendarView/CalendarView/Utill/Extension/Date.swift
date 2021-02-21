//
//  Date.swift
//  CalendarView
//
//  Created by shndrs on 2/21/21.
//

import Foundation

extension Date {
    
    static func randomDate(range: Int) -> Date {
        let interval =  Date().timeIntervalSince1970
        let intervalRange = Double(86_400 * range)
        let random = Double(arc4random_uniform(UInt32(intervalRange)) + 1)
        let newInterval = interval + (random - (intervalRange / 2.0))
        return Date(timeIntervalSince1970: newInterval)
    }
    
}
