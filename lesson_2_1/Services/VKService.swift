//
//  VKService.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 24.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//typealias dataCompletion = ([Users]?, Error?) -> Void

class VKService {
    
    let apiKey:String = "aa345abdaa345abdaa345abd7baa56a49baaa34aa345abdf131495d55c9280ba5d1b6fc"
    
    func getUsers(token: String, completion: (([User]?, Error?) -> Void)? = nil) {
        guard let url = URL(string:"https://api.vk.com/method/users.get?fields=photo_50,city,verified&access_token=\(token)&v=5.77") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion?(nil, error)
                return
            }

            if let data = data, let json = try? JSON(data: data) {
                let users = json["response"].arrayValue.map { User(json: $0) }
                
                DispatchQueue.main.async {
                    User().saveData(users)
                    completion?(users, nil)
                }
                
            }
                
                return
            }
        task.resume()
        }
    
    
    
    func getFrends(token: String) {
        let url = URL(string:"https://api.vk.com/method/friends.get?access_token=\(token)&v=5.77")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options:
                JSONSerialization.ReadingOptions.allowFragments)
            print(json)
        }
        task.resume()
    }
    
    func getGroups(token: String, completion: (([Group]?, Error?) -> Void)? = nil) {
        guard let url = URL(string:"https://api.vk.com/method/groups.get?extended=1&fields=name,photo_50&access_token=\(token)&v=5.78") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion?(nil, error)
                return
            }
            let json1 = try? JSONSerialization.jsonObject(with: data!, options:
                JSONSerialization.ReadingOptions.allowFragments)
            print(json1)
            if let data = data, let json = try? JSON(data: data) {
                let groups = json["response"]["items"].arrayValue.map { Group(json: $0) }
                DispatchQueue.main.async {
                    Group().saveData(groups)
                    completion?(groups, nil)
                }
                
            }
            
            return
        }
        task.resume()
    }
    
    func getPhotosAll(token: String, completion: (([Photo]?, Error?) -> Void)? = nil) {
        guard let url = URL(string:"https://api.vk.com/method/photos.getAll?access_token=\(token)&v=5.78") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion?(nil, error)
                return
            }
            let json1 = try? JSONSerialization.jsonObject(with: data!, options:
                JSONSerialization.ReadingOptions.allowFragments)
            print(json1)
            if let data = data, let json = try? JSON(data: data) {
                let photos = json["response"]["items"].arrayValue.map { Photo(json: $0) }
                DispatchQueue.main.async {
                    Photo().saveData(photos)
                    completion?(photos, nil)
                }
                
            }
            
            return
        }
        task.resume()
    }
    func search(token: String, strSearch: String) {
        let urlString = "https://api.vk.com/method/search.getHints?q=\(strSearch)&filters=groups&access_token=\(token)&v=5.78"
        //let urlString = "https://api.vk.com/method/users.search?q=\(strSearch)&access_token=\(token)&v=5.78"
        let urlStringEncoding = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStringEncoding!)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options:
                JSONSerialization.ReadingOptions.allowFragments)
            print(json)
        }
        task.resume()
        }
        
    }
    

