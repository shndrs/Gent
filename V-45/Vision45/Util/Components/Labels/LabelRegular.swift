//
//  LabelRegular.swift
//  WTFUserInterface
//
//  Created by NP2 on 12/4/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

// MARK: - Label Regular

final class LabelRegular: BaseLabel {
    
    override func awakeFromNib() {
        
        font = Font.regular.return(size: font.pointSize)
    }
}
