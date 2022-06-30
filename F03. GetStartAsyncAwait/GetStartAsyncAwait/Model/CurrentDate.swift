//
//  CurrentDate.swift
//  GetStartAsyncAwait
//
//  Created by Luann Luna on 11/11/21.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "currentDateTime"
    }
}
