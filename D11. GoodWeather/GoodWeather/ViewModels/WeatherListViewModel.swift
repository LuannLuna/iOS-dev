//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 11/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
}

struct WeatherViewModel: Decodable {
    
    let name: String
    let currentTemperature: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
    
}

struct TemperatureViewModel: Decodable {
    
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
    
}
