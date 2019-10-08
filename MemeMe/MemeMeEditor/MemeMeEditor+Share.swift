//
//  MemeMeEditor+Share.swift
//  MemeMe
//
//  Created by fadel sultan on 9/10/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import Foundation
import UIKit

extension MemeMeEditor {
    
    func saveImage() {
//        this funcation from this url
//        https://www.hackingwithswift.com/articles/118/uiactivityviewcontroller-by-example
        let memedImage = generateMemedImage()
        let items = [memedImage]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        https://stackoverflow.com/questions/28169192/uiactivityviewcontroller-completion-handler-returns-success-when-tweet-has-faile/34581940
        ac.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if !completed {
                // User canceled
                return
            }
            // User completed activity
//            Call funcation save data
            self.save(memedImage: memedImage)
            
        }
        present(ac, animated: true)
    }
    
    func generateMemedImage() -> UIImage {
        
        // TODO: Hide toolbar and navbar
        navBar.isHidden = true
        toolBar.isHidden = true
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // TODO: Show toolbar and navbar
        navBar.isHidden = false
        toolBar.isHidden = false
        return memedImage
    }
    
//    Funcation to save data item
    func save(memedImage:UIImage) {
        // Create the meme
        let meme = Meme(topText: textFieldTop.text!, textBottom: textFieldBottom.text!, originalImage: imageViewEditor.image!, memedImage: memedImage)
        
        // Add it to the memes array in the Application Delegate
           let object = UIApplication.shared.delegate
           let appDelegate = object as! AppDelegate
           appDelegate.memes.append(meme)
        
//        Call delegate
        delegate?.refreshMeme()
    }
}


