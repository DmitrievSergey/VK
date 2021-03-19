//
//  Session.swift
//  VK
//
//  Created by Сергей Дмитриев on 19.03.2021.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private var token: String = ""
    private var  userId: Int = 0
    
    private init() {}
}
