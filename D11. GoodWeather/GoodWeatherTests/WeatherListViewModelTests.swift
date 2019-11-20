//
//  WeatherListViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Luann Marques Luna on 20/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTests: XCTestCase {
    
    private var weatherListViewModel: WeatherListViewModel!

    override func setUp() {
        super.setUp()
        
        weatherListViewModel = WeatherListViewModel()
        
        weatherListViewModel.addWeatherViewModel(WeatherViewModel(name: "Houston", currentTemperature: TemperatureViewModel(temperature: 32, temperatureMin: 0, temperatureMax: 0)))
        weatherListViewModel.addWeatherViewModel(WeatherViewModel(name: "Austin", currentTemperature: TemperatureViewModel(temperature: 72, temperatureMin: 0, temperatureMax: 0)))
    }
    
    func test_should_be_able_to_convert_to_celsius_successfully() {
        let celsiusTemperatures = [0, 22.2222]
        
        weatherListViewModel.updateUnit(to: .celsios)
        for (index, vm) in weatherListViewModel.weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.currentTemperature.temperature.value), round(celsiusTemperatures[index]))
        }
    }

    override func tearDown() {
        super.tearDown()
    }

}
