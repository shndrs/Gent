//
//  CGPoint.swift
//  AIT-CardScanner
//
//  Created by NP2 on 2/17/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

extension CGPoint {
   func scaled(to size: CGSize) -> CGPoint {
       return CGPoint(x: self.x * size.width,
                      y: self.y * size.height)
   }
}
