//
//  FirstInitialButton.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class FirstInitialButton: BaseButton {
    
    
}

// MARK: - Methods

extension FirstInitialButton {
    
    override func setup() {
        super.setup()
        self.backgroundColor = Colors.secondaryBack
        self.clipsToBounds = true
        self.addCornerRadius(radius: 5)
        self.addBorder(color: Colors.label, thickness: 0.6)
        self.setTitleColor(Colors.label, for: .normal)
    }
    
}
