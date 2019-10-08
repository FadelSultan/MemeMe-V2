//
//  VillainTableViewCell.swift
//  MemeMe
//
//  Created by fadel sultan on 10/8/19.
//  Copyright © 2019 fadel sultan. All rights reserved.
//

import UIKit

class VillainTableViewCell: UITableViewCell {

//    outlets
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(meme:Meme) {
        imageViewPhoto.image = meme.memedImage
        labelText.text = "\(meme.topText) \(meme.textBottom)"
    }

}
