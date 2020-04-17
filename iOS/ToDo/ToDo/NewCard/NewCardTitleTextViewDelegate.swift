//
//  NewCardTitleTextViewDelegate.swift
//  ToDo
//
//  Created by Cloud on 2020/04/17.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class NewCardTitleTextViewDelegate: NSObject, Editable {
    
    static var placeholder: String = "New Card"
    
    func applyPlaceHodler(_ textView: UITextView) {
        textView.text = Self.placeholder
        textView.textColor = .systemGray
    }
    
    func willEdit(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .black
    }
}

extension NewCardTitleTextViewDelegate: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        textView.text == Self.placeholder ? willEdit(textView) : nil
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text.isEmpty ? applyPlaceHodler(textView) : nil
    }
}
