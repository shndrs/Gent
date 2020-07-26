//
//  SubmitButton.swift
//  WTFUserInterface
//
//  Created by shndrs on 4/11/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class SubmitButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - Methods

fileprivate extension SubmitButton {
    
    func setup() {
        self.setTitle(Strings.submit.rawValue, for: .normal)
        self.titleLabel?.font = Font.medium.return(size: 15)
        self.backgroundColor = Colors.submitGreen
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
    }
}
