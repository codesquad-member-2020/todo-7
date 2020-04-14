//
//  ContainerViewTableViewDelegate.swift
//  ToDo
//
//  Created by Cloud on 2020/04/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ContainerTableViewDelegate: NSObject {
    
    private var count: String = ""
    private var title: String

    init(title: String) {
        self.title = title
        super.init()
    }
}

extension ContainerTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: ContainerTableSectionHeaderView.identifier) as? ContainerTableSectionHeaderView else { return nil }
        view.updateCountingLabel(count, title)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ContainerTableSectionHeaderView.height
    }
}
