//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by Luann Luna on 15/08/21.
//

import Foundation

extension URL {
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=62f6e179179cd8913a5d4b5a817b994d")
    }
}
