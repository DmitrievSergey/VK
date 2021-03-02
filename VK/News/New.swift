//
//  New.swift
//  VK
//
//  Created by Сергей Дмитриев on 01.03.2021.
//

import Foundation
import UIKit



enum NewOwner {
    case Friends
    case Group
}

struct New {
    //var owner: NewOwner
    var photoCollection: String
    var text: String
    var buttonLiked: Bool = true
    var buttonShared: Bool = true
    var buttonCommented: Bool = true
    var buttonViewed: Bool = true
    
    init( photoCollection: String, text: String,  buttonLiked: Bool, buttonShared: Bool, buttonCommented: Bool, buttonViewed: Bool) {
        self.photoCollection = photoCollection
        self.text = text
        self.buttonLiked = buttonLiked
        self.buttonShared = buttonShared
        self.buttonCommented = buttonCommented
        self.buttonViewed = buttonViewed
    }
}
