//
//  Item.swift
//  Todoey
//
//  Created by Luann Marques Luna on 14/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation

class Item {
    var title: String = ""
    var done: Bool = false
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
