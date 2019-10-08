//
//  ViewController+TextFieldDelegate.swift
//  MemeMe
//
//  Created by fadel sultan on 9/8/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import Foundation
import UIKit

extension MemeMeEditor : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            textField.text?.removeAll()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            switch textField.tag {
            case 1:
                textField.text = "TOP"
            case 2:
                textField.text = "BOTTOM"
            default:
                print("Nothing")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
