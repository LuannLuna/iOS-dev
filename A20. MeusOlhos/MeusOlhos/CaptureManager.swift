//
//  CaptureManager.swift
//  MeusOlhos
//
//  Created by Luann Marques Luna on 10/07/19.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import Foundation
import AVKit

class CaptureManager {
    lazy var captureSession: AVCaptureSession = {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        return captureSession
    }()
    
    weak var videoBufferDelegate: AVCaptureVideoDataOutputSampleBufferDelegate?
    
    init() {
        
    }
    
    func startCameraCapture() -> AVCaptureVideoPreviewLayer? {
        if askForPermission() {
            guard let capturteDevice = AVCaptureDevice.default(for: .video) else {
                return nil
            }
            do {
                let input = try AVCaptureDeviceInput(device: capturteDevice)
                captureSession.addInput(input)
            } catch {
                print("Error: \(error.localizedDescription)")
                return nil
            }
            captureSession.startRunning()
            let videoDataOutput = AVCaptureVideoDataOutput()
            videoDataOutput.setSampleBufferDelegate(videoBufferDelegate, queue: DispatchQueue(label: "cameraQueue"))
            captureSession.addOutput(videoDataOutput)
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            return previewLayer
        }
        return nil
    }
    
    func askForPermission() -> Bool {
        var hasPermission: Bool = true
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (success) in
                hasPermission = success
            }
        case .restricted, .denied: hasPermission = false
        default:
            hasPermission = true
        }
        
        return hasPermission
    }
}
