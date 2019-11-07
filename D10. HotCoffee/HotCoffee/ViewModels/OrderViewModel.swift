//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Luann Marques Luna on 07/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel = [OrderViewModel]()
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return ordersViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order
    
}

extension OrderViewModel {
    var name: String {
        return order.name
    }
    
    var email: String {
        return order.email
    }
    
    var type: String {
        return order.type.rawValue.capitalized
    }
    
    var size: String {
        return order.size.rawValue.capitalized
    }
}
