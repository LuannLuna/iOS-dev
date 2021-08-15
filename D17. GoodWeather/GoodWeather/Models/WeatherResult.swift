//
//  WeatherResult.swift
//  GoodWeather
//
//  Created by Luann Luna on 15/08/21.
//

import Foundation

struct WeatherResult: Decodable {
    let main: Weather
}

extension WeatherResult {
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
}

struct Weather: Decodable {
    let temp, humidity: Double
}
