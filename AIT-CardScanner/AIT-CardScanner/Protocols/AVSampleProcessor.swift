//
//  AVSampleProcessor.swift
//  AIT-CardScanner
//
//  Created by NP2 on 2/19/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import AVFoundation
import UIKit

public protocol AVSampleProcessor {
  
    func convertToUiImage(from sampleBuffer: CMSampleBuffer) -> UIImage?
    func crop(_ image: UIImage, toBoundsOf areaOfInterest: CGRect,
            containedIn previewLayer: AVCaptureVideoPreviewLayer) -> UIImage?
}

