//
//  myGroupsTableViewCell.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 16.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit

class myGroupsTableViewCell: UITableViewCell {
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
