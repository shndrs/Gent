//
//  ImageProcessor.swift
//  AIT-CardScanner
//
//  Created by NP2 on 2/19/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import AVFoundation
import UIKit

struct ImageProcessor {
    private var ciContext: CIContext
  
    init(ciContext: CIContext = CIContext()) {
        self.ciContext = ciContext
    }
}

// MARK: - Helper Functions
extension ImageProcessor {
    
   private func binarise(_ image: CGImage) -> CGImage? {
      let img = UIImage(cgImage: image)
      return img.binarise().cgImage
   }

   private func contrast(_ image: CGImage) -> CGImage? {
      let img = UIImage(cgImage: image)
      return img.increaseContrast().cgImage!
   }
    
  private func calculateCroppingRect(for image: UIImage, toSize size: CGSize) -> CGRect {
    let aspectRatio = size.width / size.height
    let cropWidth = aspectRatio > 1 ? image.size.width : image.size.height * aspectRatio
    let cropHeight = aspectRatio > 1 ? cropWidth / aspectRatio : image.size.height / aspectRatio
    let cropX = aspectRatio > 1 ? 0 : (image.size.width - cropWidth) / 2.0
    let cropY = (image.size.height - cropHeight) / 2.0
    return CGRect(x: cropX, y: cropY, width: cropWidth, height: cropHeight)
  }
  
  private func crop(_ image: UIImage, toBoundsOf previewLayer: AVCaptureVideoPreviewLayer) -> UIImage? {
    let previewLayerSize = previewLayer.bounds.size
    let cropRect = calculateCroppingRect(for: image, toSize: previewLayerSize)
    return image.cgImage?.cropping(to: cropRect)
      .flatMap { croppedImage in
        return UIImage(cgImage: croppedImage, scale: image.scale, orientation: image.imageOrientation)
    }
  }
    
  private func crop(_ image: UIImage, toBoundsOf areaOfInterest: CGRect, at scale: TwoDimensionalScale) -> UIImage? {
    let resizedAreaOfInterest = resize(areaOfInterest, to: scale)
    
    return image.cgImage?.cropping(to: resizedAreaOfInterest)
      .flatMap { croppedImage in
        return UIImage(cgImage: croppedImage, scale: image.scale, orientation: image.imageOrientation)
    }
  }
  
  private func resize(_ rect: CGRect, to scale: TwoDimensionalScale) -> CGRect {
    return CGRect(x: rect.origin.x * scale.y,
                  y: rect.origin.y * scale.x,
                  width: rect.width * scale.y,
                  height: rect.height * scale.x)
  }
}

extension ImageProcessor: AVSampleProcessor {
  func convertToUiImage(from sampleBuffer: CMSampleBuffer) -> UIImage? {
    return CMSampleBufferGetImageBuffer(sampleBuffer)
        .flatMap(
          CIImage.init(cvImageBuffer:) >>>
          ciContext.createCGImage >>>
          contrast >>>
          binarise >>>
          UIImage.init
        )
  }
  
  func crop(_ image: UIImage, toBoundsOf areaOfInterest: CGRect, containedIn previewLayer: AVCaptureVideoPreviewLayer) -> UIImage? {
      return crop(image, toBoundsOf: previewLayer).flatMap { image in
          let previewLayerSize = previewLayer.bounds.size
          let scale = TwoDimensionalScale(x: image.size.height / previewLayerSize.height,
                                          y: image.size.width / previewLayerSize.width)
          return crop(image, toBoundsOf: areaOfInterest, at: scale)
      }
  }
}

private struct TwoDimensionalScale {
    private let cgPoint: CGPoint
    
    var y: CGFloat {
      return cgPoint.y
    }
    
    var x: CGFloat {
      return cgPoint.x
    }
    
    init(x: CGFloat, y: CGFloat) {
      cgPoint = CGPoint(x: x, y: y)
    }
}
