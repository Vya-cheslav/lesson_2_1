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
    
    func getDate() -> [Photo] {
        let realm = try! Realm()
        return Array(realm.objects(Photo.self))
    }
    
    func saveData(_ photo: [Photo]) {
        let realm = try! Realm()
        let truncateDate = getDate()
        
        do {
            try realm.write {
                realm.delete(truncateDate)
                realm.add(photo)
            }
        } catch {
            print(error)
        }
    }
}
