//
//  CurvedImages.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

class BaseCurvedImage: UIImageView {
    
    override func awakeFromNib() {
        self.clipsToBounds = true
    }
}

// MARK: - Light Curved Image

final class LightCurvedImage: BaseCurvedImage {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 4.0
    }
}
