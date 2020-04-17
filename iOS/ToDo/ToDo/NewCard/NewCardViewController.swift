//
//  NewCardViewController.swift
//  ToDo
//
//  Created by Cloud on 2020/04/09.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class NewCardViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Properties
    private var newCardTextViewDelegate: NewCardTextViewDelegate = NewCardTextViewDelegate()
    private var newCardTitleTextViewDelegate: NewCardTitleTextViewDelegate = NewCardTitleTextViewDelegate()
    private var categoryId: Int = 0
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.delegate = newCardTextViewDelegate
        titleTextView.delegate = newCardTitleTextViewDelegate
    }
    
    // MARK: - Actions
    @IBAction func dismissViewAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCardAction(_ sender: Any) {
        guard let title = titleTextView.text,
            let content = descriptionTextView.text else { return }
        let contents = Contents(title: title, contents: content)
        Provider.post(categoryId: categoryId, contents: contents)
        NotificationCenter.default
            .post(name: Notification.Name.updateCategroy,
                  object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    // MARK: - Methods
    func updateCategoryId(categoryId: Int) {
        self.categoryId = categoryId
    }
}
