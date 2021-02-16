//
//  ReusableView.swift
//  CalendarView
//
//  Created by shndrs on 2/16/21.
//

import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

