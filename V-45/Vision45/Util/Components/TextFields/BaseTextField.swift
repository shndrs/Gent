//
//  BaseTextField.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
}

// MARK: - Methods

extension BaseTextField {
    
    @objc func setup() {
        self.font = Font.regular.return(size: 13)
        self.textColor = Colors.label
    }
    
}
