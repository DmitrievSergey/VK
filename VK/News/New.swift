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
    var owner: NewOwner
    var photoCollection: [UIImage]
    var text: String
    var liked: ButtonLiked
    var shared: ButtonLiked
    var commented: ButtonLiked
    var viewed: ButtonLiked
}
