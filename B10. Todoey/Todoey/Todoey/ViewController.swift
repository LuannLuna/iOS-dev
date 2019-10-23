//
//  ViewController.swift
//  Todoey
//
//  Created by Luann Marques Luna on 14/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift
import ChameleonFramework

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    
    var itemArray: Results<Item>?
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let selectedCategory = selectedCategory else { return }
        
        title = selectedCategory.name
        
        if let color = UIColor(hexString: selectedCategory.color) {
            navigationController?.navigationBar.barTintColor = color
            navigationController?.navigationBar.tintColor = ContrastColorOf(color, returnFlat: true)
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : ContrastColorOf(color, returnFlat: true)
            ]
            searchBar.barTintColor = color
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        guard let originalColor = UIColor(hexString: "1D9BF6") else { return }
        navigationController?.navigationBar.barTintColor = originalColor
        navigationController?.navigationBar.tintColor = FlatWhite()
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : FlatWhite()
        ]
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var  textField: UITextField = UITextField()
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add item", style: .default, handler: { (action) in
            guard let text = textField.text else {return}
            
//            let item = Item(context: self.context)
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let item = Item()
                        item.title = text
                        item.done = false
                        item.dateCreated = Date()
        //                item.parentCategory = self.selectedCategory
                        currentCategory.items.append(item)
                    }
                } catch {
                    print("Encoder error: \(error.localizedDescription)")
                }
                
//                self.itemArray.append(item)
            }
            self.tableView.reloadData()
//            self.saveItems()
        }))
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil){
    func loadItems(){
        
        itemArray = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
//        if let data = try? Data(contentsOf: dataFilePath!)  {
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data)
                
//            } catch {
//                print("Decoder error: \(error.localizedDescription)")
//            }
//        }
        
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//
//        if let addtionalPredicate = predicate {
//            let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addtionalPredicate])
//            request.predicate  = compoundPredicate
//        } else {
//            request.predicate = categoryPredicate
//        }
//
//
//
//        do {
//           itemArray = try context.fetch(request)
//        }catch {
//            print("Error fetch: \(error.localizedDescription)")
//        }
    }
    
//    func  saveItems(){
////        let encoder = PropertyListEncoder()
//        do {
////            let data = try encoder.encode(self.itemArray)
////            try data.write(to: self.dataFilePath!)
//            try context.save()
//        } catch {
//            print("Encoder error: \(error.localizedDescription)")
//        }
//        tableView.reloadData()
//    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let item = itemArray?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
            
            if let color = UIColor(hexString: selectedCategory!.color)?.darken(byPercentage: CGFloat(indexPath.row)/CGFloat(itemArray!.count)) {
                cell.backgroundColor = color
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
        } else {
            cell.textLabel?.text = "No items added"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = itemArray?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                    if !item.done {
                        tableView.cellForRow(at: indexPath)?.accessoryType = .none
                    }else{
                        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                    }
                }
            }catch {
                print("Error save done status: \(error.localizedDescription)")
            }
        }
        
        // MARK: Deleting items
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
//        saveItems()
        
        
        
//        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        
        tableView.deselectRow(at: indexPath, animated: true)
//        saveItems()
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//
//        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
//        request.sortDescriptors = [sortDescriptor]
//
//        loadItems(with: request, predicate: predicate)
//        do {
//            itemArray = try context.fetch(request)
//        } catch {
//            print("Error: \(error.localizedDescription)")
//        }
        
//        tableView.reloadData()
        
        itemArray = itemArray?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
