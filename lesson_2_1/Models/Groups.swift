//
//  Groups.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 31.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Group: Object {
    
   @objc dynamic  var name: String = ""
   @objc dynamic  var id: String = ""
   @objc dynamic  var photo50: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.name = json["name"].stringValue
        self.id = json["id"].stringValue
        self.photo50 = json["photo_50"].stringValue
    }
    
    func saveData(_ group: [Group]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(group)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
