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
    private let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue",
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
            session.addInput(input)
        } catch {
            print ("ERROR")
        }
        let output = AVCaptureVideoDataOutput()
        session.addOutput(output)
        output.setSampleBufferDelegate(self, queue: .main)
        
//        output.outputRectConverted(fromMetadataOutputRect: square.bounds)
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubviewToFront(square)
        session.startRunning()
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
        recognizeTextInImage(image)
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
//            clearOverlay()
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
        if navigationItem.title != nil {
            session.stopRunning()
            finalImage.isHidden = false
            let vc = TextExtractorVC()
            vc.scannedImage = finalImage.image
            self.show(vc, sender: nil)
        }
        connection.videoOrientation = .portrait
        let imageBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
        let ciimage: CIImage = CIImage(cvPixelBuffer: imageBuffer)
        let img = UIImage(named: "melli-old-3")!
        let image: UIImage = self.convert(cmage: ciimage)
        finalImage.image = image
        processImage(img)
    }
}
