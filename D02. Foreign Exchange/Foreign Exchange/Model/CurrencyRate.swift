//
//  CurrencyRate.swift
//  Foreign Exchange
//
//  Created by Luann Marques Luna on 30/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation

struct CurrencyRate {
    let currencyIso: String
    let rate: Double
}

enum Currency : String {
    case EUR
    case GBP
    case USD
}

enum CurrencyLocale : String {
    case EUR = "fr_FR"
    case GBP = "en_UK"
}
