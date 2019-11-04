//
//  DayViewViewModel.swift
//  Cloudy
//
//  Created by Luann Marques Luna on 01/11/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit

struct DayViewViewModel {
    let weatherData: WeatherData
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMMM d"
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = UserDefaults.timeNotation().timeFormater
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var summary: String {
        return weatherData.summary
    }
    
    var temperature: String {
        let temperature = weatherData.temperature
        
        switch UserDefaults.temperatureNotation() {
        case .celsius:
            return String(format: "%.1f", temperature.toCelcius()) + " ºC"
        case .fahrenheit:
            return String(format: "%.1f", temperature) + " ºF"
        }
    }
    
    var windSpeed: String {
        let windSpeed = weatherData.windSpeed
        
        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.2f", windSpeed) + " MPH"
        case .metric:
            return String(format: "%.2f", windSpeed.toKPH()) + " KPH"
        }
    }
    
    var image: UIImage? {
        return UIImage.imageForIcon(withName: weatherData.icon)
    }
}
