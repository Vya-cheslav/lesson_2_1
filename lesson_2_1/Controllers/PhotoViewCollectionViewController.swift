//
//  FrendCollectionViewController.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 15.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "Cell"

class PhotoViewCollectionViewController: UICollectionViewController {

    var token: String = ""
    let service = VKService()
    
    var photoList: [Photo] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
        service.getPhotosAll(token: token) { photo, error in
            if let error = error {
                // handle error
                print(error)
                return
            }
            
            if let photo = photo {
                //print(#function)
                self.photoList = photo
                self.collectionView?.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! FrendCollectionViewCell
//        cell.frendLabel.text = frend
//        cell.frendImageView.image = UIImage(named: frend)
//        let Photo = frend as! String
//        let imageData = NSData(base64Encoded: Photo, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
//        let image = UIImage(data: imageData! as Data)
//        // Configure the cell
        cell.frendLabel.text = photoList[indexPath.row].id
        if let icon = URL(string: photoList[indexPath.row].url) {
            cell.frendImageView.kf.setImage(with: icon)
        }
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
