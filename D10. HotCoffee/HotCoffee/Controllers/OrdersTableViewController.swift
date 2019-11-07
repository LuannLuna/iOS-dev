//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 5/10/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    
    private func populateOrders() {
        guard let coffeeOrdesURL = URL(string: "https://guarded-retreat-82533.herokuapp.com") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdesURL)
        
        WebService().load(resource: resource) { [weak self] result in
            switch result {
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension OrdersTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        
        return cell
    }
}
