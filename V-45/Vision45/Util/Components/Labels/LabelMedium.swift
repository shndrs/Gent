//
//  LabelMedium.swift
//  WTFUserInterface
//
//  Created by NP2 on 12/4/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

// MARK: - Label Medium

final class LabelMedium: BaseLabel {
    
    override func awakeFromNib() {
        
        font = Font.medium.return(size: font.pointSize)
    }
}
