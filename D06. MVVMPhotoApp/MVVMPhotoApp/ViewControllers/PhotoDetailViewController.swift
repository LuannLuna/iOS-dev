//
//  PhotoDetailViewController.swift
//  MVVMPhotoApp
//
//  Created by Luann Marques Luna on 02/11/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoDetailViewController: UIViewController {

    var imageUrl: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageUrl = imageUrl {
            imageView.sd_setImage(with: URL(string: imageUrl)) { (image, error, type, url) in
            
            }
        }
        
    }

}
