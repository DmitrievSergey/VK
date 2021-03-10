//
//  FriendCollection.swift
//  VK
//
//  Created by Сергей Дмитриев on 09.03.2021.
//

import Foundation
import UIKit

class FriendsCellItem: UIImageView {
    
    var imageName: String = ""
    var title: String = ""
    var currentImage: Bool = false
    
    convenience init(imageNamed: String, title name: String, isImageCurrent current: Bool) {
        self.init()
        
        image = UIImage(named: imageNamed)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        title = name
        currentImage = current
        imageName = imageNamed

        

        autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
}

