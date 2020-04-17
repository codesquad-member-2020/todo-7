//
//  Name.swift
//  ToDo
//
//  Created by Cloud on 2020/04/09.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

extension Notification.Name {
    static var newCard: Notification.Name = Notification.Name(rawValue: "newCard")
    static var pushCellCount: Notification.Name = Notification.Name(rawValue: "pushCellCount")
    static var updateCategroy: Notification.Name = Notification.Name("updateCategroy")
    static var reloadTableView: Notification.Name = Notification.Name("reloadTableView")
}
