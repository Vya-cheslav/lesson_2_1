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
    
    func getDate() -> [Group] {
        let realm = try! Realm()
        return Array(realm.objects(Group.self))
    }
    
    func saveData(_ group: [Group]) {
        let realm = try! Realm()
        let truncateDate = getDate()
        
        do {
            try realm.write {
                realm.delete(truncateDate)
                realm.add(group)
            }
        } catch {
            print(error)
        }
    }
}
