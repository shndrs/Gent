//
//  CustomToast.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/7/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit
import Toast_Swift

final class CustomToast: NSObject {
    
    private var view: UIView!
    
    init(view: UIView) {
        self.view = view
    }
    
}

// MARK: - Methods

extension CustomToast {
    
    func show(error message: String) {
        var style = ToastStyle()
        style.backgroundColor = Colors.error
        style.titleFont = Font.bold.return(size: 16)
        style.messageFont = Font.regular.return(size: 14)
        style.titleAlignment = .center
        style.messageAlignment = .center
        style.messageColor = Colors.label
        self.view.makeToast(message, duration: 3.0, position: .top,
                            title: Strings.error.value(), style: style)
    }
    
}
