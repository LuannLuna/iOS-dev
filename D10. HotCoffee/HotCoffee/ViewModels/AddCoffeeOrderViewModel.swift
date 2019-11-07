//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Luann Marques Luna on 07/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct AddCoffeOrderViewModel {
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeeType.allCases.map{ $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeSize.allCases.map{ $0.rawValue.capitalized }
    }
}
