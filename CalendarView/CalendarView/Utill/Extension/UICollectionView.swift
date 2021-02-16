//
//  UICollectionView.swift
//  CalendarView
//
//  Created by shndrs on 2/16/21.
//

import UIKit
import JTAppleCalendar

extension UICollectionView {
    
    public func calendarViewLayout() {
        DispatchQueue.main.async { [weak self] in
            guard self != nil else { return }
            let cellSize = CGSize(width: 50, height: 50)
            let layout = UICollectionViewFlowLayout() /// JTAppleCalendarMonthLayout
            layout.itemSize = cellSize
            layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
            self?.setCollectionViewLayout(layout, animated: true)
        }
    }
    
}
