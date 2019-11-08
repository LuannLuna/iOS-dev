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

extension Order {
    init?(_ vm: AddCoffeOrderViewModel) {
        guard let name = vm.name,
        let email = vm.email,
        let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
        let selectedSize = CoffeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}

extension Order {
    
    static var all: Resource<[Order]> {
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com") else {
            fatalError("Erro creating url")
        }
        
        return Resource<[Order]>(url: url)
    }
    
    static func create(vm: AddCoffeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com") else {
            fatalError("Erro creating url")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error enconding order")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        
        return resource

    }
}
