//
//  Session.swift
//  VK
//
//  Created by Сергей Дмитриев on 19.03.2021.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    var token: String = ""
    var  userId: String = ""
    
    private init() {}
}
