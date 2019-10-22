//
//  Category.swift
//  Todoey
//
//  Created by Luann Marques Luna on 22/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
