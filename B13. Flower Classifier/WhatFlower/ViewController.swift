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
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
    let imagePicker = UIImagePickerController()
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func requestInfo(flowerName: String) {
        print("FlowerName: \(flowerName)")
        
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pithumbsize": "500"
        ]
        
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                let flowerJSON : JSON = JSON(value)
                
                let pageid = flowerJSON["query"]["pageids"][0].stringValue
                
                let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue
                let flowerImageURL = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                
                self.labelDescription.text = flowerDescription
                
                self.imageView.sd_setImage(with: URL(string: flowerImageURL), completed: { (image, error,  cache, url) in
                    
                    if let currentImage = self.imageView.image {
                        
                        guard let dominantColor = ColorThief.getColor(from: currentImage) else {
                            fatalError("Can't get dominant color")
                        }
                        
                        
                        DispatchQueue.main.async {
                            self.navigationController?.navigationBar.isTranslucent = true
                            self.navigationController?.navigationBar.barTintColor = dominantColor.makeUIColor()
                            
                            
                        }
                    } else {
                        self.imageView.image = self.pickedImage
                        self.infoLabel.text = "Could not get information on flower from Wikipedia."
                    }
                    
                })
                
            }
        }
    }
    
    
    func detect(image: CIImage){
        do {
            let model = try VNCoreMLModel(for: FlowerClassifier().model)
            
            let request = VNCoreMLRequest(model: model) { request, error in
                if error == nil {
                    guard let result = request.results as? [VNClassificationObservation] else {
                        fatalError("Model fail to process image")
                    }
                    if let firstResult = result.first {
                        self.navigationItem.title = firstResult.identifier.capitalized
                        self.requestInfo(flowerName: firstResult.identifier)
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

extension ViewController: UINavigationControllerDelegate {}
