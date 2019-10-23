//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Luann Marques Luna on 16/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
//    var categories: [Category] = []
    var categories: Results<Category>?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80.0
        
        loadCategories()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories add yet"
        cell.backgroundColor = UIColor(hexString: (categories?[indexPath.row].color ?? "1D9BF6"))
        cell.textLabel?.textColor = ContrastColorOf(UIColor(hexString: (categories?[indexPath.row].color ?? "1D9BF6"))!, returnFlat: true)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            if let index = tableView.indexPathForSelectedRow {
                vc.selectedCategory = categories?[index.row]
            }
        }
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var  textField: UITextField = UITextField()
        
        let alert = UIAlertController(title: "Addnew Category", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
            guard let text = textField.text else {return}
            
//            let category = Category(context: self.context)
            let category = Category()
            category.name = text
            category.color = UIColor.randomFlat.hexValue()
            
//            self.saveCategory()
            self.save(category: category)
        }))
         
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
//    func  saveCategory(){
    func  save(category: Category){
        do {
//            try context.save()
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Encoder error: \(error.localizedDescription)")
        }
        tableView.reloadData()
    }
    
//    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()){
    func loadCategories(){
//            do {
//               categories = try context.fetch(request)
//            } catch {
//                print("Error fetch: \(error.localizedDescription)")
//            }
        
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
//    MARK: - Deleting
    override func updateModel(at indexPath: IndexPath) {
        if let category = categories?[indexPath.row] {
            do {
                try realm.write {
                    self.realm.delete(category)
                }
            } catch {
                print("Error deleting: \(error.localizedDescription)")
            }
        }
    }
}
