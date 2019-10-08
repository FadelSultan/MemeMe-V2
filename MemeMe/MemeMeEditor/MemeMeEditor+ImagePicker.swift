//
//  MemeMeEditor+ImagePicker.swift
//  MemeMe
//
//  Created by fadel sultan on 9/10/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import Foundation
import UIKit

extension MemeMeEditor : UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    func runImagePicker(sourceType:UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageViewEditor.image = image
            btnShare.isEnabled = true
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        btnShare.isEnabled = false
        dismiss(animated: true, completion: nil)
    }
    
}
