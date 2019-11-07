//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 5/10/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

class AddOrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    private var vm = AddCoffeOrderViewModel()
    private var coffeeSizesSegmentedController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup(){
        coffeeSizesSegmentedController = UISegmentedControl(items: vm.sizes)
        coffeeSizesSegmentedController.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(coffeeSizesSegmentedController)
        
        coffeeSizesSegmentedController.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        coffeeSizesSegmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        let name = nameTextField.text
        let email = emailTextField.text
        
        let selectedSize = coffeeSizesSegmentedController.titleForSegment(at: coffeeSizesSegmentedController.selectedSegmentIndex)
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        vm.name = name
        vm.email = email
        vm.selectedSize = selectedSize
        vm.selectedType = vm.types[indexPath.row]
        
    }
}

extension AddOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = vm.types[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
