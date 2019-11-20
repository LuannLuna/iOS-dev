//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 11/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func modelAt(index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    func updateUnit(to unit: Unit){
        switch unit {
        case .celsios:
            toCelsios()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    private func toCelsios(){
        weatherViewModels = weatherViewModels.map { (vm) in
            let weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (vm.currentTemperature.temperature.value - 32) * 5/9
            return weatherModel
        }
    }
    
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { (vm) in
            let weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (vm.currentTemperature.temperature.value * 9/5) + 32
            return weatherModel
        }
    }
}

// Type Eraser
class Dynamic<T>: Decodable where T: Decodable {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
}


struct WeatherViewModel: Decodable {
    
    let name: Dynamic<String>
    var currentTemperature: TemperatureViewModel
    
    init(name: String, currentTemperature: TemperatureViewModel) {
        self.name = Dynamic(name)
        self.currentTemperature = currentTemperature
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }
    
    
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
    
}

struct TemperatureViewModel: Decodable {
    
    var temperature: Dynamic<Double>
    let temperatureMin: Dynamic<Double>
    let temperatureMax: Dynamic<Double>
    
    init(temperature: Double, temperatureMin: Double, temperatureMax: Double){
        self.temperature = Dynamic(temperature)
        self.temperatureMin = Dynamic(temperatureMin)
        self.temperatureMax = Dynamic(temperatureMax)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = Dynamic(try container.decode(Double.self, forKey: .temperature))
        temperatureMin = Dynamic(try container.decode(Double.self, forKey: .temperatureMin))
        temperatureMax = Dynamic(try container.decode(Double.self, forKey: .temperatureMax))
    }
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
    
}
