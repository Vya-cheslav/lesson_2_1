//
//  Groups.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 31.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import SwiftyJSON

class Groups {
    
    var name: String = ""
    var id: String = ""
    var photo_50: String = ""
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.id = json["id"].stringValue
        self.photo_50 = json["photo_50"].stringValue
    }
}
