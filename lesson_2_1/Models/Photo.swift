//
//  Photo.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 31.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Photo: Object {
    
   @objc dynamic  var id: String = ""
   @objc dynamic  var url: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.id = json["id"].stringValue
        self.url = json["sizes"][0]["url"].stringValue
    }
    
    func saveData(_ photo: [Photo]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(photo)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
