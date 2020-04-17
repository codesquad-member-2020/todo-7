//
//  ViewController.swift
//  ToDo
//
//  Created by Cloud on 2020/04/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var containers: [UIViewController: ContainerTableViewDataSource] = [: ]
    
    // MARK: - Lifecyles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainers()
        requestService()
    }
    
    // MARK: - Methods
    private func requestService() {
        Provider.request() { todoData in
            guard let todoData = todoData else { return }
            DispatchQueue.main.async {
                self.updateData(categories: todoData)
            }
        }
    }
    
    private func updateData(categories: Projectable) {
        for category in categories.categories {
            guard let containerViewController =
                children[category.position] as? ContainerTableViewController,
                let dataSource = containers[children[category.position]] else { return }
            containerViewController.updateData(title: category.title,
                                               count: category.cards.count)
            dataSource.updateCategory(category)
            containerViewController.updateCategoryId(category.id)
            containerViewController.tableView.reloadData()
        }
    }
    
    private func configureContainers() {
        for containerViewController in children {
            guard let containerViewController = containerViewController as? ContainerTableViewController else { return }
            let dataSource = ContainerTableViewDataSource()
            containerViewController.tableView.dataSource = dataSource
            containers.updateValue(dataSource, forKey: containerViewController)
        }
    }
}
