//
//  LiveCameraViewModel.swift
//  CameraView
//
//  Created by Agus Hery on 13/10/22.
//

import Foundation
import AVFoundation
import CoreImage
import Vision

class LiveCameraViewModel: NSObject, ObservableObject {
    @Published var frame: CGImage?
    private var permissionGranted = false
    private let captureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private let context = CIContext()

    let sequenceHandler = VNSequenceRequestHandler()
    @Published var bodyParts = [VNHumanBodyPoseObservation.JointName : VNRecognizedPoint]()
    @Published var rightHand = [VNHumanHandPoseObservation.JointName : VNRecognizedPoint]()
    @Published var leftHand = [VNHumanHandPoseObservation.JointName : VNRecognizedPoint]()
    
    override init() {
        super.init()
        checkPermission()
        sessionQueue.async { [unowned self] in
            self.setupCaptureSession()
            self.captureSession.startRunning()
        }
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized: // The user has previously granted access to the camera.
                permissionGranted = true
                
            case .notDetermined: // The user has not yet been asked for camera access.
                requestPermission()
                
        // Combine the two other cases into the default case
        default:
            permissionGranted = false
        }
    }
    
    func requestPermission() {
        // Strong reference not a problem here but might become one in the future. unowned / weak, masih belum begitu paham, jadi pakai tutor unowned dulu
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.permissionGranted = granted
        }
    }
    
    func setupCaptureSession() {
        let videoOutput = AVCaptureVideoDataOutput()
        
        guard permissionGranted else { return }
        guard let videoDevice = AVCaptureDevice.default(.builtInTrueDepthCamera ,for: .video, position: .front) else { return }
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else { return }
        guard captureSession.canAddInput(videoDeviceInput) else { return }
        captureSession.addInput(videoDeviceInput)
        
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        captureSession.addOutput(videoOutput)
        
        videoOutput.connection(with: .video)?.videoOrientation = .portrait
    }
    
    func detectedBodyPose(request: VNRequest, error: Error?) {
        guard let bodyPoseResults = request.results as? [VNHumanBodyPoseObservation]
        else { return }
        guard let bodyParts = try? bodyPoseResults.first?.recognizedPoints(.all) else { return }
        DispatchQueue.main.async {
            self.bodyParts = bodyParts
        }
    }
    
    func detectHandPose(request: VNRequest, error: Error?) {
        guard let handResult = request.results as? [VNHumanHandPoseObservation] else { return }
        
        if handResult.count > 0{
            guard let firstHand = try? handResult[0].recognizedPoints(.all) else { return }
            DispatchQueue.main.async {
                self.leftHand = firstHand
            }
        }
        if handResult.count > 1{
            guard let secondHand = try? handResult[1].recognizedPoints(.all) else { return }
            DispatchQueue.main.async {
                self.rightHand = secondHand
            }
        }
    }
}


extension LiveCameraViewModel: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let cgImage = imageFromSampleBuffer(sampleBuffer: sampleBuffer) else { return }
        
        let humanBodyRequest = VNDetectHumanBodyPoseRequest(completionHandler: detectedBodyPose)
        let handPoseRequest = VNDetectHumanHandPoseRequest(completionHandler: detectHandPose)
        do {
            try sequenceHandler.perform(
                [humanBodyRequest, handPoseRequest],
                on: sampleBuffer,
                orientation: .right)
        } catch {
            print(error.localizedDescription)
        }
        // All UI updates should be / must be performed on the main queue.
        DispatchQueue.main.async { [unowned self] in
            self.frame = cgImage
        }
    }
    
    private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> CGImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }
        return cgImage
    }
    
}
