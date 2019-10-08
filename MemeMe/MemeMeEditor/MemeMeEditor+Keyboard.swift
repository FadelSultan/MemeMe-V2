//
//  MemeMeEditor+Keyboard.swift
//  MemeMe
//
//  Created by fadel sultan on 9/10/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import Foundation
import UIKit

extension MemeMeEditor {
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification:Notification) {
        if self.textFieldTop.isEditing {return}
        view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        if self.textFieldTop.isEditing {return}
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
}
