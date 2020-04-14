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
    var tempData: [(title: String,description: String)] =
        [("4월3일", "DragAndDrop\nNSItem\nTableView\nTableViewCell"),
         ("4월2일", "오토레이아웃자성하기\n유아이작성하기\n버튼 추가"),
         ("할일","공부하기"),]
    
    // MARK: - Methods
    func delete(_ tableView: UITableView, indexPath: IndexPath) {
        tempData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension ContainerTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContainerTableViewCell.identifier, for: indexPath) as? ContainerTableViewCell else { return UITableViewCell() }
        let item = tempData[indexPath.item]
        cell.update(title: item.title, description: item.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        editingStyle == .delete ? delete(tableView, indexPath: indexPath) : nil
    }
}
