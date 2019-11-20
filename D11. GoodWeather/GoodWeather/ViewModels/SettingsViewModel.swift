//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 13/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsios = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        switch self {
        case .celsios:  return "Celsios"
        case .fahrenheit: return "Fahrenheit"
        }
    }
}

struct SettingsViewModel {
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get {
            if let value = UserDefaults.standard.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "unit")
        }
    }
}
