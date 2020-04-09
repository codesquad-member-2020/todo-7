//
//  NewCardTextViewDelegate.swift
//  ToDo
//
//  Created by Cloud on 2020/04/09.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class NewCardTextViewDelegate: NSObject {
    
}

extension NewCardTextViewDelegate: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updateText = currentText.replacingCharacters(in: stringRange, with: text)
        return updateText.count <= 500
    }
}
