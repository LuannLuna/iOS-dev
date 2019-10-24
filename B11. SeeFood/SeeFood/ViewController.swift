//
//  ViewController.swift
//  SeeFood
//
//  Created by Luann Marques Luna on 23/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let apiKey = ""
    let version = "2019-10-23"
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func detect(image: CIImage){
        do {
            let model = try VNCoreMLModel(for: MobileNetV2().model)
            
            let request = VNCoreMLRequest(model: model) { request, error in
                if error == nil {
                    guard let result = request.results as? [VNClassificationObservation] else {
                        fatalError("Model fail to process image")
                    }
                    if let firstResult = result.first {
                        if firstResult.identifier.contains("hotdog") {
                            self.navigationItem.title = "Hotdog !"
                        } else {
                            self.navigationItem.title = "Not Hotdog!"
                        }
                    }
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
            
            try! handler.perform([request])
        } catch {
            print("Model error: \(error.localizedDescription)")
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            
            guard let ciimage = CIImage(image: image) else {
                fatalError("Couldn't convert the image")
            }
            
            detect(image: ciimage)
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UINavigationControllerDelegate {
    
}
