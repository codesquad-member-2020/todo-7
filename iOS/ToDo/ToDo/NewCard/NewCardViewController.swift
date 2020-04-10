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
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Properties
    private var newCardTextViewDelegate: NewCardTextViewDelegate = NewCardTextViewDelegate()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.delegate = newCardTextViewDelegate
    }
    
    // MARK: - Actions
    @IBAction func dismissViewAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCardAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    // MARK: - Methods
    

}
