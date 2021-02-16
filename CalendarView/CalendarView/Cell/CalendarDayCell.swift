//
//  CalendarDayCell.swift
//  CalendarView
//
//  Created by shndrs on 2/16/21.
//

import UIKit
import JTAppleCalendar

final class CalendarDayCell: JTACDayCell, ReusableView {

    @IBOutlet var selectedView: UIView! {
        didSet {
            selectedView.layer.cornerRadius = 16
            selectedView.layer.masksToBounds = true
        }
    }
    @IBOutlet var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
