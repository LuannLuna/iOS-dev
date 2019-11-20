//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 13/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func settingDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    private var settingsViewModel = SettingsViewModel()
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = settingsViewModel.units[indexPath.row].displayName
        if settingsViewModel.units[indexPath.row] == settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach { (cell) in
            cell.accessoryType = .none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let unit = Unit.allCases[indexPath.row]
        settingsViewModel.selectedUnit = unit
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if let delegate = delegate {
            delegate.settingDone(vm: settingsViewModel)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
