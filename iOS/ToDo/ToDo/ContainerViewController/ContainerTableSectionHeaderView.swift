//
//  ToDoSectionHeaderView.swift
//  ToDo
//
//  Created by Cloud on 2020/04/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit

class ContainerTableSectionHeaderView: UITableViewHeaderFooterView {
    
    static var height: CGFloat = 50
    static var identifier: String = "ContainerTableSectionHeaderView"
    private var countingLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var addCellButton: UIButton!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func updateCountingLabel(count: String, title: String) {
        countingLabel.text = count
        descriptionLabel.text = title
    }
    
    private func configure() {
        configureCountingLabel()
        configureDescriptionLabe()
        configureAddCellButton()
    }
    
    private func configureCountingLabel() {
        countingLabel = UILabel()
        countingLabel.textAlignment = .center
        countingLabel.layer.masksToBounds = true
        countingLabel.layer.cornerRadius = 17
        addSubview(countingLabel)
        countingLabel.backgroundColor = .white
        countingLabelMakeConstraint()
    }
    
    private func configureDescriptionLabe() {
        descriptionLabel = UILabel()
        addSubview(descriptionLabel)
        titleLabelMakeConstraint()
    }
    
    private func configureAddCellButton() {
        addCellButton = UIButton()
        addCellButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addCellButton.tintColor = .darkGray
        addSubview(addCellButton)
        addCellButtonMakeConstraint()
        addCellButton.addTarget(self, action: #selector(addCellAction), for: .touchUpInside)
    }
    
    private func countingLabelMakeConstraint() {
        countingLabel.snp.makeConstraints { make in
            make.width.equalTo(countingLabel.snp.height)
            make.leading.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(8)
        }
    }
    
    private func titleLabelMakeConstraint() {
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(countingLabel.snp.trailing).offset(8)
            make.top.bottom.equalToSuperview().inset(8)
        }
    }
    
    private func addCellButtonMakeConstraint() {
        addCellButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(8)
            make.width.equalTo(addCellButton.snp.height)
        }
    }
    
    @objc func addCellAction() {
        NotificationCenter.default
            .post(name: Notification.Name.newCard,
                  object: nil)
    }
}

