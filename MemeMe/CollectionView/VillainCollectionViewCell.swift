//
//  VillainCollectionViewCell.swift
//  MemeMe
//
//  Created by fadel sultan on 10/8/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import UIKit

class VillainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewMemeImage: UIImageView!
    @IBOutlet weak var labelTextTopBotton: UILabel!
    
    func set(meme:Meme){
        imageViewMemeImage.image = meme.memedImage
        labelTextTopBotton.text = "\(meme.topText) \(meme.textBottom)"
    }
}
