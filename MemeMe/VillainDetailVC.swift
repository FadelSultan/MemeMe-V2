//
//  VillainDetailVC.swift
//  MemeMe
//
//  Created by fadel sultan on 10/8/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import UIKit

class VillainDetailVC: UIViewController {

//    outlets
    @IBOutlet weak var imageViewMemeImage: UIImageView!
    @IBOutlet weak var labelMemeTopButtom: UILabel!
    
    var meme:Meme?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let meme = meme {
            imageViewMemeImage.image = meme.memedImage
            labelMemeTopButtom.text = "\(meme.topText) \(meme.textBottom)"
        }
    }

}
