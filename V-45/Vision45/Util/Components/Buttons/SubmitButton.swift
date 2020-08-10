//
//  SubmitButton.swift
//  WTFUserInterface
//
//  Created by shndrs on 4/11/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class SubmitButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
}

// MARK: - Methods

fileprivate extension SubmitButton {
    
    func setup() {
        self.setTitle(Strings.submit.value(), for: .normal)
        self.setTitleColor(Colors.label, for: .normal)
        self.titleLabel?.font = Font.medium.return(size: 15)
        self.addBorder(color: Colors.label, thickness: 0.6)
        self.backgroundColor = Colors.tertiaryBack
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
    }
    
}
