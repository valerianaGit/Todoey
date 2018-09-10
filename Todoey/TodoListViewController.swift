//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Valeria Duran on 8/30/18.
//  Copyright © 2018 Valeria Duran. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
     let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(dataFilePath)
        
        loadItems()
    }

    //MARK: tbale view datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none //ternary operator 
        
        return cell
    }
    
    //MARK: table view delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done//the opposite of now
        
        saveItems()
    
       
        
        
        tableView.deselectRow(at: indexPath, animated: true) //goes back to being deselected in grey
        
    }
    
    //MARK: ADD new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once user clicks add button item on ui alert
            //print(textField.text)
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.saveItems()
        
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
          
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: Model Manipulation Methods
    
        func saveItems() {
            let encoder = PropertyListEncoder()
            
            do{
                let data = try encoder.encode(itemArray)
                try data.write(to: dataFilePath!)
            } catch {
                print("Error encoding item array, \(error)")
            }
            
            self.tableView.reloadData()
        }
        
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
            itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
    }

}

