//
//  ToDoTableViewDataSource.swift
//  ToDo
//
//  Created by Cloud on 2020/04/08.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

extension Notification.Name {
    static var pushCellCount: Notification.Name = Notification.Name(rawValue: "pushCellCount")
}

class ToDoTableViewDataSource: NSObject {
    var tempData: [(title: String,description: String)] = [("할일","공부하기"),
                                                           ("4월2일", "오토레이아웃자성하기\n유아이 작성하기\n버튼 추가"),
                                                           ("4월3일", "DragAndDrop\nNSItem\nTableView\nTableViewCell")] 
    
}

extension ToDoTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NotificationCenter.default
            .post(name: Notification.Name.pushCellCount, object: nil, userInfo: ["count": tempData.count])
        return tempData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContainerTableViewCell.identifier, for: indexPath) as? ContainerTableViewCell else { return UITableViewCell() }
        let item = tempData[indexPath.item]
        cell.update(title: item.title, description: item.description)
        return cell
    }
}
