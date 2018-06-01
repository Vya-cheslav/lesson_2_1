//
//  Users.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 30.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class User: Object {
    
    @objc dynamic var firstname: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var photo50: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.firstname = json["first_name"].stringValue
        self.id = json["id"].stringValue
        self.lastname = json["last_name"].stringValue
        self.photo50 = json["photo_50"].stringValue
    }
    
    func saveData(_ user: [User]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(user)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
