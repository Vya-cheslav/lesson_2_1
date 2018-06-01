//
//  Photo.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 31.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo {
    
    var id: String = ""
    var url: String = ""
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.url = json["sizes"][0]["url"].stringValue
    }
}
