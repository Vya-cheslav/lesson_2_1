//
//  addGroupCell.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 18.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit

class addGroupCell: UITableViewCell {
    
    @IBOutlet weak var addGroupImageView: UIImageView!
    
    @IBOutlet weak var addGroupNameLabel: UILabel!
    
    @IBOutlet weak var addGroupCountLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
