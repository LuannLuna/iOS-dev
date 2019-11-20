//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 13/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f", self) + "º"
    }
}
