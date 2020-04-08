//
//  ToDoTableViewDelegate.swift
//  ToDo
//
//  Created by Cloud on 2020/04/08.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ToDoTableViewDelegate: NSObject {
    
    private var count: Int = 0
    
    override init() {
        super.init()
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(reloadCount),
                         name: Notification.Name.pushCellCount,
                         object: nil)
    }
    
    @objc func reloadCount(_ notification: Notification) {
        guard let userInfo = notification.userInfo?["count"] as? String,
            let count = Int(userInfo) else { return }
        self.count = count
    }
}

extension ToDoTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: ContainerTableSectionHeaderView.identifier) as? ContainerTableSectionHeaderView else { return nil }
        view.updateCountingLabel(count: String(count), title: "Todo")
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ContainerTableSectionHeaderView.height
    }
}
