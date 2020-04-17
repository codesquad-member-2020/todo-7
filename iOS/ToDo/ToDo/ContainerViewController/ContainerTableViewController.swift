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
    
    @objc func modalNewCard() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewCardViewController")
        present(viewController, animated: true, completion: nil)
    }
    
    @objc func updateCount(_ notification: Notification) {
        guard let userInfo = notification.userInfo?["count"] else { return }
        let result = userInfo as! (identifier: String, count: String)
        result.identifier == tableView.description ?
            sectionView.applyCountChange(result.count) : nil
    }
}
