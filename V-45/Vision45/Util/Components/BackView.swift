//
//  BackView.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/27/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

class BackgroundView: UIView {
    
    override func awakeFromNib() {
        setup()
    }
}

// MARK: - Methods

extension BackgroundView {
    @objc public func setup() {
        self.addCornerRadius(radius: 5)
        self.addBorder(color: .darkGray, thickness: 0.5)
    }
}
