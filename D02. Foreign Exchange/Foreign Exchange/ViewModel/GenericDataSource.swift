//
//  GenericDataSource.swift
//  Foreign Exchange
//
//  Created by Luann Marques Luna on 30/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
