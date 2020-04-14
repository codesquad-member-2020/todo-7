//
//  ContainerViewTableViewDelegate.swift
//  ToDo
//
//  Created by Cloud on 2020/04/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ContainerTableViewDelegate: NSObject {
    
}

extension ContainerTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: ContainerTableSectionHeaderView.identifier) as? ContainerTableSectionHeaderView else { return nil }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ContainerTableSectionHeaderView.height
    }
}
