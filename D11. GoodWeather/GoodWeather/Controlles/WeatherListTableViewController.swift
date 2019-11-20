//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 11/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private var weatherListViewModel: WeatherListViewModel = WeatherListViewModel()
    private var dataSource: TableViewDataSource<WeatherCell, WeatherViewModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = TableViewDataSource(cellIdentifier: "cell", items: weatherListViewModel.weatherViewModels, configureCell: { (cell, vm) in
            cell.prepare(vm)
        })
        tableView.dataSource = dataSource
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WeatherDetail" {
            if let vc = segue.destination as? WeatherDetailViewController {
                if let index = tableView.indexPathForSelectedRow {
                    vc.weatherViewModel = weatherListViewModel.modelAt(index: index.row)
                }
            }
        } else if let navC = segue.destination as? UINavigationController {
            if let vc = navC.children.first as? AddWeatherCityViewController {
                vc.delegate = self
            } else if let vc = navC.children.first as? SettingsTableViewController {
                vc.delegate = self
            }
        }
    }

}

extension WeatherListTableViewController: SettingsDelegate {
    func settingDone(vm: SettingsViewModel) {
        weatherListViewModel.updateUnit(to: vm.selectedUnit)
        tableView.reloadData()
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        if let dataSource = dataSource {
            dataSource.updateItems(weatherListViewModel.weatherViewModels)
        }
        tableView.reloadData()
    }
    
}
