//
//  TableViewCell.swift
//  ToDo
//
//  Created by Cloud on 2020/04/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    static var identifier: String = "ContainerTableViewCell"
    
    // MARK: - Methods
    func update(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        descriptionLabel.numberOfLines = 3
        descriptionLabel.lineBreakMode = .byTruncatingTail
    }
}
