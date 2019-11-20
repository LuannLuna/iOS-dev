//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 11/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    func  prepare(_ model: WeatherViewModel) {
        textLabel?.text = model.name.value
        detailTextLabel?.text = model.currentTemperature.temperature.value.formatAsDegree
    }
    
}
