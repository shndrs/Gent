//
//  EmptyView.swift
//  WTFUserInterface
//
//  Created by shndrs on 3/14/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class EmptyView: UIView {}

// MARK: - Methods

extension EmptyView {
    private func setup() {
        self.backgroundColor = .clear
    }
}

// MARK: Life Cycle

extension EmptyView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}
