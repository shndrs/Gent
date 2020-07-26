//
//  TransBackgroundView.swift
//  WTFUserInterface
//
//  Created by shndrs on 4/11/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class TransBackgroundView: BackgroundView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setup() {
        super.setup()
        self.clipsToBounds = true
    }
    
}
