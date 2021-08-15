//
//  FilterService.swift
//  CameraFilter
//
//  Created by Luann Luna on 12/08/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit
import CoreImage
import RxSwift

class FilterService {
    private var context: CIContext
    
    init() {
        context = CIContext()
    }
    
    func applytFilter(to inputImage: UIImage) -> Observable<UIImage> {
        return Observable<UIImage>.create { observer in
            self.applyFilter(to: inputImage) {
                observer.onNext($0)
            }
            
            return Disposables.create()
        }
    }
    
    private
    func applyFilter(to inputImage: UIImage, completion: @escaping ((UIImage)->Void)) {
        guard let filter = CIFilter(name: "CICMYKHalftone") else { return }
        filter.setValue(5.0, forKey: kCIInputWidthKey)
        
        guard let sourceImage = CIImage(image: inputImage) else {
            return
        }
        
        filter.setValue(sourceImage, forKey: kCIInputImageKey)
        if let cmImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cmImage, scale: inputImage.scale, orientation: inputImage.imageOrientation)
            completion(processedImage)
        }
    }
    
}
