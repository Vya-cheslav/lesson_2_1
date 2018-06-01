//
//  Users.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 30.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    var firstname: String = ""
    var id: String = ""
    var lastname: String = ""
    var photo50: String = ""
    
    init(json: JSON) {
        self.firstname = json["first_name"].stringValue
        self.id = json["id"].stringValue
        self.lastname = json["last_name"].stringValue
        self.photo50 = json["photo_50"].stringValue
    }
}
