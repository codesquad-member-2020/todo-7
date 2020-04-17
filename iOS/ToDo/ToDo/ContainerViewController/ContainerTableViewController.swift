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
    private var sectionView: ContainerTableSectionHeaderView!
    private var categoryId: Int = 0
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionView = ContainerTableSectionHeaderView(reuseIdentifier: ContainerTableSectionHeaderView.identifier)
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(modalNewCard),
                         name: Notification.Name.newCard,
                         object: nil)
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(updateCount),
                         name: Notification.Name.pushCellCount,
                         object: nil)
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(reloadTableView),
                         name: Notification.Name.reloadTableView,
                         object: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ContainerTableSectionHeaderView.height
    }
    
    func updateData(title: String, count: Int) {
        sectionView.updateCountingLabel(String(count), title)
    }
    
    func updateCategoryId(_ categoryId: Int) {
        self.categoryId = categoryId
    }
    
    @objc func modalNewCard(_ notification: Notification) {
        guard let userInfo = notification.userInfo?["contentView"] as? UIView else { return }
        if userInfo == sectionView.contentView {
            guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewCardViewController") as? NewCardViewController else { return }
            viewController.updateCategoryId(categoryId: categoryId)
            present(viewController, animated: true, completion: nil)
        }
    }
    
    @objc func updateCount(_ notification: Notification) {
        guard let userInfo = notification.userInfo?["count"] else { return }
        let result = userInfo as! (identifier: Int, count: String)
        result.identifier == categoryId ?
            sectionView.applyCountChange(result.count) : nil
    }
    
    @objc func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
