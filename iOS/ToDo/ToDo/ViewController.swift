//
//  ViewController.swift
//  ToDo
//
//  Created by Cloud on 2020/04/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var todoTableViewDataSource = ToDoTableViewDataSource()
    var todoTableViewDelegate = ToDoTableViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDo" {
            guard let toDoViewController = segue.destination as? ContainerTableViewController else { return }
            toDoViewController.tableView.dataSource = todoTableViewDataSource
            toDoViewController.tableView.delegate = todoTableViewDelegate
        }
    }
}
