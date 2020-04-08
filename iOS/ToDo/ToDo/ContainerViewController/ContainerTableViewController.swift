//
//  firstTableViewController.swift
//  ToDo
//
//  Created by Cloud on 2020/04/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ContainerTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView
            .register(ContainerTableSectionHeaderView.self,
                      forHeaderFooterViewReuseIdentifier: ContainerTableSectionHeaderView.identifier)
    }
}
