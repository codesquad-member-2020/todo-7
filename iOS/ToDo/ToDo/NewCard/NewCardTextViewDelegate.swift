//
//  NewCardTextViewDelegate.swift
//  ToDo
//
//  Created by Cloud on 2020/04/09.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

protocol Editable {
    static var placeholder: String { get }
    func applyPlaceHodler(_ textView: UITextView)
    func willEdit(_ textView: UITextView)
}

class NewCardTextViewDelegate: NSObject, Editable {
    
    // MARK: - Properties
    static var limit: Int = 500
    static var placeholder = "새로운 카드 만들기"

    // MARK: - Methods
    
    func applyPlaceHodler(_ textView: UITextView) {
        textView.text = Self.placeholder
        textView.textColor = .systemGray
    }
    
    func willEdit(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .black
    }
    
    func limit(text: String, range: NSRange, max: Int) -> Bool {
        guard let range = Range(range, in: text) else { return false }
        let result = text.replacingCharacters(in: range, with: text)
        return result.count < max
    }
}

extension NewCardTextViewDelegate: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        limit(text: textView.text, range: range, max: NewCardTextViewDelegate.limit)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text == Self.placeholder ? willEdit(textView) : nil
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text.isEmpty ? applyPlaceHodler(textView) : nil 
    }
}
