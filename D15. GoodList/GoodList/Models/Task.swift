//
//  Task.swift
//  GoodList
//
//  Created by Luann Luna on 15/08/21.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
