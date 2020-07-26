//
//  LabelBold.swift
//  WTFUserInterface
//
//  Created by NP2 on 12/4/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

// MARK: - Label Bold

final class LabelBold: BaseLabel {
    
    override func awakeFromNib() {
        
        font = Font.bold.return(size: font.pointSize)
    }
}
