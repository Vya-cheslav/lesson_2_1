//
//  Users.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 30.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import SwiftyJSON

class Users {
    
    var first_name: String = ""
    var id: String = ""
    var last_name: String = ""
    var photo_50: String = ""
    
    init(json: JSON) {
        self.first_name = json["first_name"].stringValue
        self.id = json["id"].stringValue
        self.last_name = json["last_name"].stringValue
        self.photo_50 = json["photo_50"].stringValue
    }
}
