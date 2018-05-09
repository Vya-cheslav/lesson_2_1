//
//  UIView+Layer.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 08.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
           return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
