//
//  AVCaptureDevice.swift
//  AIT-CardScanner
//
//  Created by NP2 on 2/19/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import AVFoundation

extension AVCaptureDevice {

    func configureDesiredFrameRate(_ desiredFrameRate: Int) {

        var isFPSSupported = false

        do {
            let videoSupportedFrameRateRanges = activeFormat.videoSupportedFrameRateRanges
            for range in videoSupportedFrameRateRanges {
                if (range.maxFrameRate >= Double(desiredFrameRate) && range.minFrameRate <= Double(desiredFrameRate)) {
                    isFPSSupported = true
                    break
                }
            }
            if isFPSSupported {
                try lockForConfiguration()
                activeVideoMaxFrameDuration = CMTimeMake(value: 1, timescale: Int32(desiredFrameRate))
                activeVideoMinFrameDuration = CMTimeMake(value: 1, timescale: Int32(desiredFrameRate))
                unlockForConfiguration()
            }

        } catch {
            print("lockForConfiguration error: \(error.localizedDescription)")
        }
    }

}

