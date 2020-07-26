//
//  BaseButton.swift
//  WTFUserInterface
//
//  Created by shndrs on 6/1/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Methods

extension BaseButton {
    func setup() {
        self.titleLabel?.font = Font.regular.return(size: 15)
        self.backgroundColor = Colors.clear
        self.clipsToBounds = true
    }
}
