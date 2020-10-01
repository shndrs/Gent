//
//  SetButton.swift
//  Vision45
//
//  Created by NP2 on 9/14/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class SetButton: BaseButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
}

// MARK: - Methods

extension SetButton {
    
    override func setup() {
        super.setup()
        self.setTitle(Strings.set.value(), for: .normal)
        self.setTitleColor(Colors.set, for: .normal)
        self.titleLabel?.font = Font.medium.return(size: 15)
        self.addBorder(color: Colors.set, thickness: 0.6)
        self.layer.cornerRadius = 5.0
    }
    
}

