//
//  FriendCollectionCellControllerCollectionViewCell.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit

class FriendCollectionCellView: UICollectionViewCell {
    
    @IBOutlet weak var imageCellCollection: UIImageView!
    @IBOutlet weak var customButtonLiked: ButtonLiked!
    
    func configureButtonLike() {
        customButtonLiked.buttonOffImage = UIImage(systemName: "heart")!
        customButtonLiked.buttonOnImage = UIImage(systemName: "heart.fill")!
        customButtonLiked.countLabel.text = "0"
        customButtonLiked.countLabel.textColor = .red
        customButtonLiked.isPressed = false
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
