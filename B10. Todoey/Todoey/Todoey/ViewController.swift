//
//  ViewController.swift
//  Todoey
//
//  Created by Luann Marques Luna on 14/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var itemArray = [Item]()
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = ud.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var  textField: UITextField = UITextField()
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add item", style: .default, handler: { (action) in
            guard let text = textField.text else {return}
            self.itemArray.append(Item(title: text, done: false))
            self.ud.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }))
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        if !itemArray[indexPath.row].done {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
