//
//  frendsCollectionView.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 15.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit

class frendsCollectionView: UICollectionViewController {

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
        -> Int {
            return 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as!
            FrendCollectionViewCell
            cell.frendLabel.text = "30 C"
            return cell
    }
    /*
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
