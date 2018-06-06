//
//  history+TableViewController.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 12.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit
import Kingfisher

class groupsTableViewController: UITableViewController {

    @IBOutlet weak var addButton: UIBarButtonItem!
    var token: String = ""
    let service = VKService()
    
    var groupsList: [Group] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getGroups(token: token) { groups, error in
            if let error = error {
                // handle error
                print(error)
                return
            }
            
            let group = Group()
            self.groupsList = group.getDate()
            self.tableView?.reloadData()
        }
        
        //navigationController?.tabBarItem.badgeValue =   String(strList.count)

        //navigationController?.tabBarController?.childViewControllers[0].tabBarItem.badgeValue = "00"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
//    @IBAction func addGroup(segue: UIStoryboardSegue){
//        guard let groupAddController = segue.source as? groupAddTableViewController else {
//            return
//        }
//        if let indexPath = groupAddController.tableView.indexPathForSelectedRow {
//
//            var group = ""
//
//            if (groupAddController.filter.count > 0) {
//
//                group = groupAddController.filter[indexPath.row]
//            }
//            else {
//
//                group = groupAddController.strList[indexPath.row]
//            }
//
//
//
//            guard !strList.contains(group) else {return}
//            strList.append(group)
//            tableView.reloadData()
//            navigationController?.tabBarItem.badgeValue =   String(strList.count)
//        }
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! myGroupsTableViewCell

        // Configure the cell...
        cell.groupTextLabel.text = groupsList[indexPath.row].name
        if let icon = URL(string: groupsList[indexPath.row].photo50) {
            cell.groupImageView.kf.setImage(with: icon)
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAddGroups" {
            
//            let destinationVC: groupAddTableViewController = segue.destination as! groupAddTableViewController
//            for (_, value1) in groupsList.enumerated() {
//                for (index2, value2) in destinationVC.strList.enumerated() {
//                    if value1 == value2{
//                        destinationVC.strList.remove(at: index2)
//                    }
//                }
//            }
        }
    }
//

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            strList.remove(at: indexPath.row)
//            tableView.reloadData()
//            navigationController?.tabBarItem.badgeValue =   String(strList.count)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
