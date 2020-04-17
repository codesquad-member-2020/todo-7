//
//  NewCardTextViewDelegate.swift
//  ToDo
//
//  Created by Cloud on 2020/04/09.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

protocol Editable {
    func applyPlaceHolder(_ textView: UITextView)
    func placeHodler(_ textView: UITextView)
    func willEdit(_ textView: UITextView)
    func limit(text: String, range: NSRange, max: Int) -> Bool
}

class NewCardTextViewDelegate: NSObject, Editable {
    
    // MARK: - Properties
    static var limit: Int = 500
    
    // MARK: - Methods
    func applyPlaceHolder(_ textView: UITextView) {
        textView.text.isEmpty ? placeHodler(textView) : willEdit(textView)
    }
    
    func placeHodler(_ textView: UITextView) {
        textView.text = "새로운 카드 만들기"
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
        applyPlaceHolder(textView)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text.isEmpty ? placeHodler(textView) : nil
    }
}
