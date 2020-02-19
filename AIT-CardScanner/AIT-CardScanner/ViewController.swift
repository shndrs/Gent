//
//  ViewController.swift
//  AIT-CardScanner
//
//  Created by NP2 on 2/17/20.
//  Copyright © 2020 shndrs. All rights reserved.n 
//

import UIKit
import AVFoundation
import Vision

final class ViewController: UIViewController {
    
    private let session = AVCaptureSession()
    private var video = AVCaptureVideoPreviewLayer()
    private var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    private let textRecognitionWorkQueue = DispatchQueue(label: "VisionQueue",
                                                         qos: .userInitiated, attributes: [],
                                                         autoreleaseFrequency: .workItem)
    @IBOutlet private weak var square: UIImageView!
    @IBOutlet private weak var finalImage: UIImageView! {
        didSet {
            finalImage.isHidden = true
        }
        
    }
    
}

// MARK: - Methods

extension ViewController {
    private func sessionSetup() {
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            input.device.configureDesiredFrameRate(10)
            session.addInput(input)
        } catch {
            print ("ERROR")
        }
        let output = AVCaptureVideoDataOutput()
        session.addOutput(output)
        
        output.setSampleBufferDelegate(self, queue: .main)
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubviewToFront(square)
        session.startRunning()
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.session.stopRunning()
        }
    }

    private func convert(cmage: CIImage) -> UIImage {
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(cmage, from: cmage.extent)!
        let image = UIImage(cgImage: cgImage)
        return image
    }
    
    // MARK: - Vision Setup
    
    private func setupVision() {
        textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            var detectedText = ""
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                detectedText += topCandidate.string
                detectedText += "\n"
            }
            DispatchQueue.main.async { [weak self] in
                guard self != nil else { return }
                self?.navigationItem.title = detectedText
            }
        }
        textRecognitionRequest.recognitionLevel = .accurate
    }
    
    private func processImage(_ image: UIImage) {
        self.recognizeTextInImage(image)
    }
    
    private func recognizeTextInImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        textRecognitionWorkQueue.async {
            let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try requestHandler.perform([self.textRecognitionRequest])
            } catch {
                print(error)
            }
        }
    }
    
    private func snapshot(in imageView: UIImageView, rect: CGRect) -> UIImage {
        return UIGraphicsImageRenderer(bounds: rect).image { _ in
            imageView.drawHierarchy(in: imageView.bounds, afterScreenUpdates: true)
        }
    }
}

// MARK: - Life Cycle

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVision()
        sessionSetup()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Output Sample Buffer Delegate

extension ViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if (navigationItem.title != nil) && (navigationItem.title?.count == 19) {
            
    //            finalImage.isHidden = false
    //            let vc = TextExtractorVC()
    //            vc.scannedImage = snapshot(in: finalImage, rect: square.frame)
    //            self.show(vc, sender: nil)
        }
                        
//        autoreleasepool {
            connection.videoOrientation = .portrait
            let imageBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
            let ciimage: CIImage = CIImage(cvPixelBuffer: imageBuffer)
//            let img = UIImage(named: "melli-old-3")!
            let image: UIImage = self.convert(cmage: ciimage)
//            self.finalImage.image = image1
            self.processImage(image)
//        }
    }
   
}

extension AVCaptureDevice {

    /// http://stackoverflow.com/questions/21612191/set-a-custom-avframeraterange-for-an-avcapturesession#27566730
    func configureDesiredFrameRate(_ desiredFrameRate: Int) {

        var isFPSSupported = false

        do {

            if let videoSupportedFrameRateRanges = activeFormat.videoSupportedFrameRateRanges as? [AVFrameRateRange] {
                for range in videoSupportedFrameRateRanges {
                    if (range.maxFrameRate >= Double(desiredFrameRate) && range.minFrameRate <= Double(desiredFrameRate)) {
                        isFPSSupported = true
                        break
                    }
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
