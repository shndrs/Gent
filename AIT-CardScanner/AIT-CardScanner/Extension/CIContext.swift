//
//  CIContext.swift
//  AIT-CardScanner
//
//  Created by NP2 on 2/19/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

extension CIContext {
  
    func createCGImage(_ ciImage: CIImage) -> CGImage? {
        return createCGImage(ciImage, from: ciImage.extent)
    }
}

