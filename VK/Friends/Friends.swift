//
//  Friends.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit


struct Collection {
    let fotoName: [String]
}

var friendsCollection: [String: [String]] = [
    "Kate":["Kate_collection-1", "Kate_collection-2", "Kate_collection"],
    "Nick":["Nick-collection", "Nick-collection2"],
    "Alex":["Alex-collection", "Alex-collection1"],
    "Alen":["Alen-collection"],
    "Serg":["Serg-collection"],
    "Duke":["Duke-collection", "Duke-collection1"],
    "Default":[]
]

struct Friends {
    let friendName: String
    var friendAva: UIImage{
        if let ava = UIImage(named: friendName){
            return ava
        } else {return UIImage(systemName: "heart")!}
    }
    
    var friendCollection:[String]{
        let name = "\(friendName)"
        if let collectionName = friendsCollection[name] {
            return collectionName
        } else { return friendsCollection["Default"]!}
    }
    
    init(friendName: String) {
        self.friendName = friendName
    }
}
