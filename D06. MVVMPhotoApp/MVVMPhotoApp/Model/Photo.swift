//
//  Photo.swift
//  MVVMPhotoApp
//
//  Created by Luann Marques Luna on 01/11/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import Foundation

struct Photos: Codable {
    let photos: [Photo]
}

struct Photo: Codable {
    let id: Int
    let name: String
    let description: String?
    let created_at: Date
    let image_url: String
    let for_sale: Bool
    let camera: String?
}
