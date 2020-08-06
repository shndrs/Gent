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
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

// MARK: - Methods

extension BaseTextField {
    
    @objc func setup() {
        self.font = Font.regular.return(size: 13)
        self.textColor = Colors.label
    }
    
}
