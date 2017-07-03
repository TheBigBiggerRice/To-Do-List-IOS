//
//  CoreDataHelper.swift
//  ToDoList
//
//  Created by Chenyang Zhang on 6/27/17.
//  Copyright © 2017 Chenyang Zhang. All rights reserved.
//
import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func newToDo() -> ToDo {
        let todo = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: managedContext) as! ToDo
        return todo
    }
    static func saveToDo() {
        do {
           try managedContext.save()
            
        }catch let error as NSError {
            print("could not save \(error)")
        }
    
    }
    static func deleteToDo(todo: ToDo) {
        managedContext.delete(todo)
        saveToDo()
    }
    static func retrieveToDo() -> [ToDo] {
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        do{
            let results = try managedContext.fetch(fetchRequest)
            return results
        }catch let error as NSError {
            print("could not fetch \(error)")
        }
        return []
    }
}
