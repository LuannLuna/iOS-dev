//
//  Order.swift
//  HotCoffee
//
//  Created by Luann Marques Luna on 07/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large

}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeSize
}
