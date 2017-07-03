//
//  ToDoListTableViewCell.swift
//  ToDoList
//
//  Created by Chenyang Zhang on 6/27/17.
//  Copyright © 2017 Chenyang Zhang. All rights reserved.
//

import UIKit
class ToDoListTableViewCell: UITableViewCell {
    @IBOutlet weak var ToDoTitleLabel: UILabel!
    @IBOutlet weak var ToDoModificationLabel: UILabel!
    
    func markAsDone(done: Bool) {
        if true == done {
            backgroundColor = UIColor(red: 120/255.0, green: 40/255.0, blue: 107/255.0, alpha: 1.0)
        } else {
            backgroundColor = .clear
        }
    }
    
    override func prepareForReuse() {
        backgroundColor = .clear
    }

}
    
