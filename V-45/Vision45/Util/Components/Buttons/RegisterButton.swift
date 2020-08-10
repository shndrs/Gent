//
//  RegisterButton.swift
//  WTFUserInterface
//
//  Created by shndrs on 5/26/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class RegisterButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
}

// MARK: - Methods

fileprivate extension RegisterButton {
    
    func setup() {
        self.titleLabel?.font = Font.bold.return(size: 15)
        self.backgroundColor = Colors.clear
    }
    
}
