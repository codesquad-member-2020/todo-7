//
//  ContainerTableViewDataSource.swift
//  ToDo
//
//  Created by Cloud on 2020/04/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

protocol TableViewDeletable {
    func delete(_ tableView: UITableView, indexPath: IndexPath)
}

class ContainerTableViewDataSource: NSObject, TableViewDeletable {
    
    // MARK: - Properties
    private var category: Categoriable?
    
    override init() {
        super.init()
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(notifiedCategory),
                         name: Notification.Name.updateCategroy,
                         object: nil)
    }
    
    // MARK: - Methods
    func delete(_ tableView: UITableView, indexPath: IndexPath) {
        category?.cards.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        pushCellCount()
    }
    
    func updateCategory(_ category: Categoriable) {
        self.category = category
    }
    
    private func pushCellCount() {
        let count = String(category?.cards.count ?? 0)
        let userInfo = (category?.id, count)
        NotificationCenter.default
            .post(name: Notification.Name.pushCellCount,
                  object: nil,
                  userInfo: ["count": userInfo])
    }
    
    @objc func notifiedCategory(_ notifiaction: Notification) {
        Provider.request { todo in
            guard let todo = todo else { return }
            for category in todo.categories {
                self.category?.id == category.id ? self.category = category : nil
                self.pushCellCount()
                NotificationCenter.default
                    .post(name: Notification.Name.reloadTableView,
                          object: nil)
            }
        }
    }
}

extension ContainerTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.cards.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContainerTableViewCell.identifier, for: indexPath) as? ContainerTableViewCell,
            let item = category?.cards[indexPath.row] else { return UITableViewCell() }
        cell.update(title: item.title, description: item.contents)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let category = category else { return }
        Provider.delete(categoryId: category.id,
                        cardId: category.cards[indexPath.row].id)
        editingStyle == .delete ? delete(tableView, indexPath: indexPath) : nil
    }
}
