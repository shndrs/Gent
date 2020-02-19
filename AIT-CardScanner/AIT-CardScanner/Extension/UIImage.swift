//
//  UIImage.swift
//  AIT-CardScanner
//
//  Created by NP2 on 2/19/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

extension UIImage {
    func binarise() -> UIImage {
        
        let glContext = EAGLContext(api: .openGLES2)!
        let ciContext = CIContext(eaglContext: glContext, options: [CIContextOption.outputColorSpace : NSNull()])
        let filter = CIFilter(name: "CIPhotoEffectMono")
        filter!.setValue(CIImage(image: self), forKey: "inputImage")
        let outputImage = filter!.outputImage
        let cgimg = ciContext.createCGImage(outputImage!, from: (outputImage?.extent)!)
        
        return UIImage(cgImage: cgimg!)
    }
    
    func increaseContrast() -> UIImage {
        let inputImage = CIImage(image: self)!
        let parameters = [ "inputContrast": NSNumber(value: 1)  ]
        let outputImage = inputImage.applyingFilter("CIColorControls", parameters: parameters)
        
        let context = CIContext(options: nil)
        let img = context.createCGImage(outputImage, from: outputImage.extent)!
        return UIImage(cgImage: img)
   }
}
