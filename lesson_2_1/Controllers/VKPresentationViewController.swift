//
//  VKPresentationViewController.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 26.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit

class VKPresentationViewController: UIViewController {

    var token: String = ""
    let service = VKService()
    
    @IBOutlet weak var searchTextFild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let VKPresentVC: VKLoginViewController = self.navigationController?.childViewControllers[0] as? VKLoginViewController {
            self.token = VKPresentVC.token
        }
    }

    @IBAction func getUser(_ sender: Any) {
        service.getUsers(token: token)
    }
    
    @IBAction func getFrends(_ sender: Any) {
        service.getFrends(token: token)
    }
    @IBAction func getGroups(_ sender: Any) {
        service.getGroups(token: token)
    }
    
    @IBAction func getPhotosAll(_ sender: Any) {
        service.getPhotosAll(token: token)
    }
    
    @IBAction func search(_ sender: Any) {
        if let strSearch = searchTextFild.text {
            service.search(token: token,strSearch: strSearch)
        }
        
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
