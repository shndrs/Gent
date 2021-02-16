//
//  CalendarDayCell.swift
//  CalendarView
//
//  Created by shndrs on 2/16/21.
//

import UIKit
import JTAppleCalendar

final class CalendarDayCell: JTACDayCell, ReusableView {

    @IBOutlet var selectedView: UIView!
    @IBOutlet var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
