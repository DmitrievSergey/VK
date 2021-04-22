//
//  NetworkService.swift
//  VK
//
//  Created by Сергей Дмитриев on 22.04.2021.
//

import Foundation
import Alamofire

class NetworkService {
    

    private let appId = "a9e758e5a9e758e5a9e758e5e2a990df9eaa9e7a9e758e5c967b463feba4b78913383d1"
    
    static func loadGroups(userId: String, token: String) {
        
        let parameters: Parameters = [
            "access_token": token,
            "user_id": userId,
            "extended": "1",
            "v": "5.92"
        ]
        let scheme = "https://"
        let host = "api.vk.com"
        let path = "/method/groups.get"
        
        Alamofire.AF.request(scheme + host + path, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                print(json)
            }
        }

    }
    
    static func loadGroupsBySearch(userId: String, token: String, stringSearch: String) {
        
        let parameters: Parameters = [
            "q": stringSearch,
            "access_token": token,
            "user_id": userId,
            "v": "5.92"
        ]
        let scheme = "https://"
        let host = "api.vk.com"
        let path = "/method/groups.search"
        
        Alamofire.AF.request(scheme + host + path, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                print(json)
            }
        }

    }
    
    static func getAllUserPhotos(userId: String, token: String) {
        
        let parameters: Parameters = [
            "owner_id": "639773313",
            "access_token": token,
            "user_id": userId,
            "extended": "1",
            "photo_size": "1",
            "no_service_albums": "1",
            "v": "5.92"
        ]
        let scheme = "https://"
        let host = "api.vk.com"
        let path = "/method/photos.getAll"
        
        Alamofire.AF.request(scheme + host + path, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                print(json)
            }
        }

    }
    
    static func getUserFriends(userId: String, token: String) {
        
        let parameters: Parameters = [
            "access_token": token,
            "user_id": userId,
            "order": "hints",
            "v": "5.92"
        ]
        let scheme = "https://"
        let host = "api.vk.com"
        let path = "/method/friends.get"
        
        Alamofire.AF.request(scheme + host + path, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                print(json)
            }
        }

    }



}
