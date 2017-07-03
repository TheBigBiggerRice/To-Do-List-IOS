//
//  DisplayToDoViewControllefr.swift
//  ToDoList
//
//  Created by Chenyang Zhang on 6/27/17.
//  Copyright © 2017 Chenyang Zhang. All rights reserved.
//

import UIKit
class DisplayToDoViewController: UIViewController {
    @IBOutlet weak var ToDoContentTextView: UITextView!
    @IBOutlet weak var ToDoContentTextField: UITextField!
    var todo: ToDo?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save" {
            // if note exists, update title and content
            let todo = self.todo ?? CoreDataHelper.newToDo()
            todo.title = ToDoContentTextField.text ?? ""
            todo.content = ToDoContentTextView.text ?? ""
            todo.modificationTime = Date() as NSDate
            CoreDataHelper.saveToDo()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let todo = todo {
            
            ToDoContentTextField.text = todo.title
            ToDoContentTextView.text = todo.content
        } else {
            ToDoContentTextField.text = ""
            ToDoContentTextView.text = ""
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ToDoContentTextView.setContentOffset(CGPoint.zero, animated: false)
    }
}
