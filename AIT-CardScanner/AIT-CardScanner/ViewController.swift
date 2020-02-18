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
    
    private let photoOutput = AVCapturePhotoOutput()
    private var isCapturing = false
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    var scannerMetadataObj : AVMetadataMachineReadableCodeObject?
    
    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession.addOutput(photoOutput)
        
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)

        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("Failed to get the camera device")
            return
        }

        do {

            let input = try AVCaptureDeviceInput(device: captureDevice)

            captureSession.addInput(input)

            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            captureSession.addOutput(photoOutput)

            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [.qr, .pdf417, .dataMatrix]
        } catch {
            return
        }

        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)

        qrCodeFrameView = UIView()

        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubviewToFront(qrCodeFrameView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        captureSession.startRunning()

    }

    override func viewWillDisappear(_ animated: Bool) {
        captureSession.stopRunning()
        qrCodeFrameView?.frame = CGRect.zero
    }
}

extension ViewController: AVCaptureMetadataOutputObjectsDelegate, AVCapturePhotoCaptureDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        let photoSettings = AVCapturePhotoSettings()
        if !isCapturing {
            isCapturing = true
            photoOutput.capturePhoto(with: photoSettings, delegate: self)
        }
    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        isCapturing = false
        guard let imageData = photo.fileDataRepresentation() else {
            print("Error while generating image from photo capture data.");
            return
        }
        guard let qrImage = UIImage(data: imageData) else {
            print("Unable to generate UIImage from image data.");
            return
        }
        testImageView.image = qrImage
    }

}

//class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
//
//    @IBOutlet weak var square: UIImageView!
//    var video = AVCaptureVideoPreviewLayer()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let session = AVCaptureSession()
//        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
//
//        do
//        {
//            let input = try AVCaptureDeviceInput(device: captureDevice)
//            session.addInput(input)
//        }
//        catch
//        {
//            print ("ERROR")
//        }
//
////        let output = AVCaptureMetadataOutput()
//        let output = AVCaptureVideoDataOutput()
//        session.addOutput(output)
//        output.setSampleBufferDelegate(self, queue: .main)
//
////        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
////
////        output.metadataObjectTypes = [AVMetadataObject.ObjectType.aztec]
////
//        video = AVCaptureVideoPreviewLayer(session: session)
//        video.frame = view.layer.bounds
//        view.layer.addSublayer(video)
//        self.view.bringSubviewToFront(square)
//
//        session.startRunning()
//    }
//
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//
//        if connection.activeVideoStabilizationMode == .standard {
//            let imageBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
//            let ciimage : CIImage = CIImage(cvPixelBuffer: imageBuffer)
//            let image : UIImage = self.convert(cmage: ciimage)
//            let secondVC = TextExtractorVC()
//            secondVC.scannedImage = image
//            self.navigationController?.pushViewController(secondVC, animated: false)
//        }
//    }
//
//    func convert(cmage:CIImage) -> UIImage {
//        let context:CIContext = CIContext.init(options: nil)
//        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
//        let image:UIImage = UIImage.init(cgImage: cgImage)
//        return image
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}

///STate

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
