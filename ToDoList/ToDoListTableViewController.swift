//
//  ListNotesTableViewController.swift
//  ToDoList
//
//  Created by Chenyang Zhang on 6/27/17.
//  Copyright © 2017 Chenyang Zhang. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var todos = [ToDo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        todos = CoreDataHelper.retrieveToDo()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListTableViewCell", for: indexPath) as! ToDoListTableViewCell
        let row = indexPath.row
        let todo = todos[row]
        if todo.done == true {
            cell.backgroundColor = UIColor(red: 120/255.0, green: 40/255.0, blue: 107/255.0, alpha: 1.0)
        }
        if todo.done == false {
            cell.backgroundColor = .clear
        }
        
        cell.ToDoTitleLabel.text = todo.title
        cell.ToDoModificationLabel.text = todo.modificationTime?.convertToString()
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayToDo" {
                print("Table view cell tapped")
                
                let indexPath = tableView.indexPathForSelectedRow!
                
                let todo = todos[indexPath.row]
                
                let displayToDoViewController = segue.destination as! DisplayToDoViewController
                
                displayToDoViewController.todo = todo
            } else if identifier == "addToDo" {
                print("+ button tapped")
            }
        }
    }
    @IBAction func unwindToDoListViewController(_ segue: UIStoryboardSegue) {
        self.todos = CoreDataHelper.retrieveToDo()
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
    
            let doneRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Done", handler:{action, indexpath in
                print("DONE•ACTION");
                if let cell = tableView.cellForRow(at: indexPath) as? ToDoListTableViewCell {
                    cell.markAsDone(done: true)
                    // first you get the row/index
                    let index = indexPath.row
                    // second retrive item from array
                    let selectedToDoItem = self.todos[index]
                    // update the todo item
                    selectedToDoItem.done = true
                    CoreDataHelper.saveToDo()
                    tableView.setEditing(false, animated: true)
                    
            
                }
            });
            doneRowAction.backgroundColor = .green;
        let undoRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Undo", handler: {action, indextpath in
            print("UNDO•ACTION");
            if let cell = tableView.cellForRow(at: indexPath) as? ToDoListTableViewCell {
                cell.markAsDone(done: false)
                let index = indexPath.row
                let selectedToDoItem = self.todos[index]
                selectedToDoItem.done = false
                CoreDataHelper.saveToDo()
                tableView.setEditing(false, animated:true)
        }
        });
        undoRowAction.backgroundColor = .gray;
            
            
            let deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler:{action, indexpath in
                print("DELETE•ACTION");
                CoreDataHelper.deleteToDo(todo: self.todos[indexPath.row])
                self.todos = CoreDataHelper.retrieveToDo()
            });
            return [deleteRowAction, doneRowAction, undoRowAction];
    
        
        
        
    }

}
        
        
        
        
        
        
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListTableViewCell", for: indexPath)
        //cell.textLabel?.text = "Yay, it's working!"
        //return cell
    

