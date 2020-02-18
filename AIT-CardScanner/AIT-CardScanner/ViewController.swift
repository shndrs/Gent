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

final class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    var video = AVCaptureVideoPreviewLayer()
    private var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    private let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue",
                                                         qos: .userInitiated, attributes: [],
                                                         autoreleaseFrequency: .workItem)
    @IBOutlet weak var square: UIImageView!
    
    private func sessionSetup() {
        let session = AVCaptureSession()
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
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubviewToFront(square)
        session.startRunning()
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {

        let imageBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
        let ciimage : CIImage = CIImage(cvPixelBuffer: imageBuffer)
        let img = UIImage(named: "melli-old-3")!
        let image : UIImage = self.convert(cmage: ciimage)
        processImage(img)
    }

    func convert(cmage:CIImage) -> UIImage {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
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

/// STATE 1

//final class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
//    var captureSession: AVCaptureSession!
//    var previewLayer: AVCaptureVideoPreviewLayer!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = UIColor.black
//        captureSession = AVCaptureSession()
//
//        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
//        let videoInput: AVCaptureDeviceInput
//
//        do {
//            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
//        } catch {
//            return
//        }
//
//        if (captureSession.canAddInput(videoInput)) {
//            captureSession.addInput(videoInput)
//        } else {
//            failed()
//            return
//        }
////21 8888 1415
////        16540
//        let metadataOutput = AVCaptureMetadataOutput()
//
//        if (captureSession.canAddOutput(metadataOutput)) {
//            captureSession.addOutput(metadataOutput)
//
//            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//            metadataOutput.metadataObjectTypes = [.itf14]
//        } else {
//            failed()
//            return
//        }
//
//        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//        previewLayer.frame = view.layer.bounds
//        previewLayer.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(previewLayer)
//
//        captureSession.startRunning()
//    }
//
//    func failed() {
//        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
//        captureSession = nil
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        if (captureSession?.isRunning == false) {
//            captureSession.startRunning()
//        }
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        if (captureSession?.isRunning == true) {
//            captureSession.stopRunning()
//        }
//    }
//
//    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//        captureSession.stopRunning()
//
//        if let metadataObject = metadataObjects.first {
//            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
//            guard let stringValue = readableObject.stringValue else { return }
//            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
//            found(code: stringValue)
//        }
//
//        dismiss(animated: true)
//    }
//
//    func found(code: String) {
//        print(code)
//    }
//
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
//
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return .portrait
//    }
//}
//// STEP 1
//final class ViewController: UIViewController {
//
//    private let photoOutput = AVCapturePhotoOutput()
//    private var isCapturing = false
//    private var captureSession = AVCaptureSession()
//    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
//    private var qrCodeFrameView: UIView?
//    private var scannerMetadataObj : AVMetadataMachineReadableCodeObject?
//
//    let cameraOutput = AVCapturePhotoOutput()
//
//    func capturePhoto() {
//
//        let settings = AVCapturePhotoSettings()
//        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
//        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
//                             kCVPixelBufferWidthKey as String: 160,
//                             kCVPixelBufferHeightKey as String: 160]
//        settings.previewPhotoFormat = previewFormat
//        captureSession.addOutput(photoOutput)
//        self.cameraOutput.capturePhoto(with: settings, delegate: self)
//    }
//
//
//
//    @IBOutlet weak var testImageView: UIImageView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        captureSession.addOutput(photoOutput)
//        capturePhoto()
////        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera],
////                                                                      mediaType: AVMediaType.video,
////                                                                      position: .back)
////
////        guard let captureDevice = deviceDiscoverySession.devices.first else {
////            print("Failed to get the camera device")
////            return
////        }
////        do {
////            let input = try AVCaptureDeviceInput(device: captureDevice)
////            captureSession.addInput(input)
////            let captureMetadataOutput = AVCaptureMetadataOutput()
////            captureSession.addOutput(captureMetadataOutput)
////            captureSession.addOutput(photoOutput)
////            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
////            captureMetadataOutput.metadataObjectTypes = [.qr, .pdf417, .dataMatrix]
////        } catch {
////            return
////        }
////
////        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
////        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
////        videoPreviewLayer?.frame = view.layer.bounds
////        view.layer.addSublayer(videoPreviewLayer!)
////        qrCodeFrameView = UIView()
////        if let qrCodeFrameView = qrCodeFrameView {
////            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
////            qrCodeFrameView.layer.borderWidth = 2
////            view.addSubview(qrCodeFrameView)
////            view.bringSubviewToFront(qrCodeFrameView)
////        }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        captureSession.startRunning()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        captureSession.stopRunning()
//        qrCodeFrameView?.frame = CGRect.zero
//    }
//}
//
//extension ViewController: AVCaptureMetadataOutputObjectsDelegate, AVCapturePhotoCaptureDelegate {
//    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//        let photoSettings = AVCapturePhotoSettings()
//        if !isCapturing {
//            isCapturing = true
//            photoOutput.capturePhoto(with: photoSettings, delegate: self)
//        }
//    }
////    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
////        isCapturing = false
////        guard let imageData = photo.fileDataRepresentation() else {
////            print("Error while generating image from photo capture data.");
////            return
////        }
////        guard let qrImage = UIImage(data: imageData) else {
////            print("Unable to generate UIImage from image data.");
////            return
////        }
////        testImageView.image = qrImage
////    }
//
//    func photoOutput(_ output: AVCapturePhotoOutput,
//                     didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?,
//                     previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?,
//                     resolvedSettings: AVCaptureResolvedPhotoSettings,
//                     bracketSettings: AVCaptureBracketedStillImageSettings?,
//                     error: Error?) {
//        if let error = error {
//            print(error.localizedDescription)
//        }
//
//        if let sampleBuffer = photoSampleBuffer,
//            let previewBuffer = previewPhotoSampleBuffer,
//            let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer,
//                                                                             previewPhotoSampleBuffer: previewBuffer) {
//            print("image:\(String(describing: UIImage(data: dataImage)?.size))")
//        }
//    }
//
//}

/// State 2

//final class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
//
//    private let captureSession = AVCaptureSession()
//    private lazy var previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
//    private let videoDataOutput = AVCaptureVideoDataOutput()
//    private var isTapped = false
//
//    lazy var item: UINavigationItem = {
//        let item = UINavigationItem()
//        item.setRightBarButton(UIBarButtonItem(title: "Detect",
//                                               style: .plain,
//                                               target: self,
//                                               action: #selector(doScan(sender:))),
//                               animated: false)
//        return item
//    }()
//
//    private var maskLayer = CAShapeLayer()
//}
//
//// MARK: - Methods
//
//extension ViewController {
//
//
//    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
//
//         let imageBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
//         let ciimage : CIImage = CIImage(cvPixelBuffer: imageBuffer)
//         let image : UIImage = self.convert(cmage: ciimage)
//    }
//
//    // Convert CIImage to CGImage
//    func convert(cmage:CIImage) -> UIImage
//    {
//         let context:CIContext = CIContext.init(options: nil)
//         let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
//         let image:UIImage = UIImage.init(cgImage: cgImage)
//         return image
//    }
//
//
//    private func doPerspectiveCorrection(_ observation: VNRectangleObservation, from buffer: CVImageBuffer) {
//        var ciImage = CIImage(cvImageBuffer: buffer)
//
//        let topLeft = observation.topLeft.scaled(to: ciImage.extent.size)
//        let topRight = observation.topRight.scaled(to: ciImage.extent.size)
//        let bottomLeft = observation.bottomLeft.scaled(to: ciImage.extent.size)
//        let bottomRight = observation.bottomRight.scaled(to: ciImage.extent.size)
//
//        ciImage = ciImage.applyingFilter("CIPerspectiveCorrection", parameters: [
//            "inputTopLeft": CIVector(cgPoint: topLeft),
//            "inputTopRight": CIVector(cgPoint: topRight),
//            "inputBottomLeft": CIVector(cgPoint: bottomLeft),
//            "inputBottomRight": CIVector(cgPoint: bottomRight),
//        ])
//
//        let context = CIContext()
//        let cgImage = context.createCGImage(ciImage, from: ciImage.extent)
//        let output = UIImage(cgImage: cgImage!)
//
//        let secondVC = TextExtractorVC()
//        secondVC.scannedImage = UIImage(named: "melli-old-3")
//        //output
//        self.navigationController?.pushViewController(secondVC, animated: false)
//    }
//
//    @objc func doScan(sender: UIButton!){
//        self.isTapped = true
//    }
//
//    public func captureOutput(
//        _ output: AVCaptureOutput,
//        didOutput sampleBuffer: CMSampleBuffer,
//        from connection: AVCaptureConnection) {
//
//        guard let frame = CMSampleBufferGetImageBuffer(sampleBuffer) else {
//            debugPrint("unable to get image from sample buffer")
//            return
//        }
//        self.detectRectangle(in: frame)
//    }
//
//    private func setCameraInput() {
//        guard let device = AVCaptureDevice.DiscoverySession(
//            deviceTypes: [.builtInWideAngleCamera, .builtInDualCamera, .builtInTrueDepthCamera],
//            mediaType: .video,
//            position: .back).devices.first else {
//                fatalError("No back camera device found.")
//        }
//        let cameraInput = try! AVCaptureDeviceInput(device: device)
//        self.captureSession.addInput(cameraInput)
//    }
//
//    private func showCameraFeed() {
//        self.previewLayer.videoGravity = .resizeAspectFill
//        self.view.layer.addSublayer(self.previewLayer)
//        self.previewLayer.frame = self.view.frame
//    }
//
//    private func setCameraOutput() {
//        self.videoDataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString) : NSNumber(value: kCVPixelFormatType_32BGRA)] as [String : Any]
//
//        self.videoDataOutput.alwaysDiscardsLateVideoFrames = true
//        self.videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "camera_frame_processing_queue"))
//        self.captureSession.addOutput(self.videoDataOutput)
//
//        guard let connection = self.videoDataOutput.connection(with: AVMediaType.video),
//            connection.isVideoOrientationSupported else { return }
//        connection.videoOrientation = .portrait
//    }
//
//    private func detectRectangle(in image: CVPixelBuffer) {
//
//        let request = VNDetectRectanglesRequest(completionHandler: { (request: VNRequest, error: Error?) in
//            DispatchQueue.main.async {
//
//                guard let results = request.results as? [VNRectangleObservation] else { return }
//                self.removeMask()
//
//                guard let rect = results.first else{return}
//                    self.drawBoundingBox(rect: rect)
//
//                    if self.isTapped{
//                        self.isTapped = false
//
//                        self.doPerspectiveCorrection(rect, from: image)
//                    }
//            }
//        })
//        request.minimumAspectRatio = VNAspectRatio(1.3)
//        request.maximumAspectRatio = VNAspectRatio(1.6)
//        request.minimumSize = Float(0.5)
//        request.maximumObservations = 1
//        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: image, options: [:])
//        try? imageRequestHandler.perform([request])
//    }
//
//    private func drawBoundingBox(rect: VNRectangleObservation) {
//
//        let transform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -self.previewLayer.frame.height)
//        let scale = CGAffineTransform.identity.scaledBy(x: self.previewLayer.frame.width, y: self.previewLayer.frame.height)
//
//        let bounds = rect.boundingBox.applying(scale).applying(transform)
//        createLayer(in: bounds)
//    }
//
//    private func createLayer(in rect: CGRect) {
//        maskLayer = CAShapeLayer()
//        maskLayer.frame = rect
//        maskLayer.cornerRadius = 10
//        maskLayer.opacity = 0.75
//        maskLayer.borderColor = UIColor.green.cgColor
//        maskLayer.borderWidth = 5.0
//        previewLayer.insertSublayer(maskLayer, at: 1)
//    }
//
//    func removeMask() {
//        maskLayer.removeFromSuperlayer()
//    }
//}
//
//// MARK: - Life Cycle
//
//extension ViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setCameraInput()
//        self.showCameraFeed()
//        self.setCameraOutput()
//        self.navigationController?.navigationBar.setItems([item], animated: false)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        let queue = DispatchQueue(label: "camera_frame_processing_queue")
//        self.videoDataOutput.setSampleBufferDelegate(self,
//                                                     queue: queue)
//        self.captureSession.startRunning()
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        self.videoDataOutput.setSampleBufferDelegate(nil, queue: nil)
//        self.captureSession.stopRunning()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        self.previewLayer.frame = self.view.frame
//    }
//
//}
