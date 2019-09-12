//
//  ObjectsViewController.swift
//  MeusOlhos
//
//  Created by Eric Brito
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ObjectsViewController: UIViewController {
    
    @IBOutlet weak var viCamera: UIView!
    @IBOutlet weak var lbIdentifier: UILabel!
    @IBOutlet weak var lbConfidence: UILabel!
    
    lazy var captureManager: CaptureManager = {
        let captureManager = CaptureManager()
        captureManager.videoBufferDelegate = self
        return captureManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbConfidence.text = ""
        lbIdentifier.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let previewLayer = captureManager.startCameraCapture() else { return }
        previewLayer.frame = viCamera.bounds
        viCamera.layer.addSublayer(previewLayer)
    }
    
    @IBAction func analyse(_ sender: UIButton) {
        let word = lbIdentifier.text!.components(separatedBy: ", ").first!
        let text = "I am \(lbConfidence.text) confident that this is a \(word)"
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

extension ObjectsViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: SqueezeNet().model) else { return }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            if error == nil {
                guard let results = request.results as? [VNClassificationObservation] else { return }
                guard let firstObservation = results.first else { return }
                DispatchQueue.main.async {
                    self.lbIdentifier.text = firstObservation.identifier
                    self.lbConfidence.text = String(describing: round(firstObservation.confidence * 1000) / 10) + "%"
                }
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
}