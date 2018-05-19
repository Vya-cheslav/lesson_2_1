//
//  history+TableViewController.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 12.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit

class history_TableViewController: UITableViewController {
   
     var strList: [String] = ["Денни Оушен","Расти Райан","Лайнус Колдуэлл"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.tabBarItem.badgeValue =   String(strList.count)
//        if let VC: history_TableViewController = (navigationController?.tabBarController?.viewControllers![0].navigationController?.viewControllers as? history_TableViewController)! {
//            print("1")
//        }
        navigationController?.tabBarController?.childViewControllers[0].tabBarItem.badgeValue = String(strList.count)
        if let groupControllerVC: groupsTableViewController = navigationController?.tabBarController?.childViewControllers[1].childViewControllers[0] as? groupsTableViewController {
            navigationController?.tabBarController?.childViewControllers[1].tabBarItem.badgeValue = String(groupControllerVC.strList.count)
        }
        
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

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
        return strList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AllFrendsCell

        // Configure the cell...
        cell.FrendsLabel.text = strList[indexPath.row]
        cell.FrendView.image = UIImage(named: strList[indexPath.row])
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCollectionFrend" {
            if let indexPath = tableView.indexPathForSelectedRow{
                segue.destination.title = strList[indexPath.row]
                if let destinationVC: FrendCollectionViewController = segue.destination as! FrendCollectionViewController {
                    destinationVC.frend = strList[indexPath.row]
                }
            }
            
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
