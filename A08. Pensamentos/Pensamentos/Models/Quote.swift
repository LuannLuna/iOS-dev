//
//  Quote.swift
//  Pensamentos
//
//  Created by Luann Luna on 22/01/19.
//  Copyright © 2019 luna. All rights reserved.
//

import Foundation
struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "“" + quote + "”"
    }
    
    var authorFormatted: String {
        return "- " + author + " -"
    }
}
