//
//  ViewController.swift
//  MemeMe
//
//  Created by fadel sultan on 9/4/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import UIKit

//I'm adding MemeMeEditorDelegate because function ViewDidApper not run with present in swift 5
protocol MemeMeEditorDelegate {
    func refreshMeme()
}

class MemeMeEditor: UIViewController {

//    outlets
    @IBOutlet weak var textFieldTop: UITextField!
    @IBOutlet weak var textFieldBottom: UITextField!
    @IBOutlet weak var btnCamera: UIBarButtonItem!
    @IBOutlet weak var btnShare: UIBarButtonItem!
    @IBOutlet weak var imageViewEditor: UIImageView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var toolBar: UIToolbar!
    
//    delegates
    var delegate:MemeMeEditorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        btnCamera.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
//    Actiones
    @IBAction func runImagePicker(_ sender: UIBarButtonItem) {
        sender.tag == 1 ? runImagePicker(sourceType: .camera) : runImagePicker(sourceType: .photoLibrary)
    }
    
    
    @IBAction func btnShare(_ sender: Any) {
        saveImage()
    }
    
    @IBAction func btnResetEditor(_ sender: Any) {
        textFieldTop.text = "TOP"
        textFieldBottom.text = "BOTTOM"
        imageViewEditor.image = nil
        btnShare.isEnabled = false
    }
    
    func setupTextField(){
        let defaultText: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth:  -3
        ]
        
        [textFieldTop , textFieldBottom].forEach { (textField) in
            textField?.defaultTextAttributes = defaultText
            textField?.textAlignment = .center
        }
        
    }
}



