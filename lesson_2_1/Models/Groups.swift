//
//  Groups.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 31.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import SwiftyJSON

class Group {
    
    var name: String = ""
    var id: String = ""
    var photo50: String = ""
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.id = json["id"].stringValue
        self.photo50 = json["photo_50"].stringValue
    }
}