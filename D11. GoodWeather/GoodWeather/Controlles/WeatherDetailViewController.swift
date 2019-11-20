//
//  WeatherDetailViewController.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 19/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVMBindings()
    }

    func setupVMBindings() {
        if let weatherViewModel = weatherViewModel {
            weatherViewModel.name.bind { self.cityName.text = $0 }
            weatherViewModel.currentTemperature.temperature.bind { self.currentTemperature.text = $0.formatAsDegree }
            weatherViewModel.currentTemperature.temperatureMin.bind { self.minTemperature.text = $0.formatAsDegree }
            weatherViewModel.currentTemperature.temperatureMax.bind { self.maxTemperature.text = $0.formatAsDegree }
        }
        
        // Change Value after few seconds
        //DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        //    self.weatherViewModel?.name.value = "Boston"
        //}
    }
}
