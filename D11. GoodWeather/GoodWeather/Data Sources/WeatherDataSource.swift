//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 19/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = ""
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeatherCell
        
        cell.prepare(weatherListViewModel.modelAt(index: indexPath.row))
        
        return cell
    }
    
}
