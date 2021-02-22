//
//  FriendsListViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit

class FriendsListViewController: UITableViewController {
    
    var friends: Array<Array<Friends>> = [
        [Friends(friendName: "Alex"), Friends(friendName: "Alen")],
        [Friends(friendName: "Kate")],
        [Friends(friendName: "Serg")],
        [Friends(friendName: "Duke")],
        [Friends(friendName: "Nick")]
    ]
    var sections:Array<String> = ["A", "K", "S", "D", "N"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
    //TODO: Увеличить высоту бар итема
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.sections[section]
    
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.font = UIFont(name: "System.Bold", size: 50)
       
    }
    
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendCellView 

        let friend = friends[indexPath.section][indexPath.row]
        
        cell.friendNameLabel.text = friend.friendName
        cell.friendAvaImage.imView.image = friend.friendAva

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFriendCollectionSegue",
           let senderCell = sender as? FriendCellView,
           let cellIndexPath = tableView.indexPath(for: senderCell),
           let friendCollectionViewcontroller = segue.destination as? FriendCollectionViewController {
            let selectedFriend = friends[cellIndexPath.section][cellIndexPath.row]
            friendCollectionViewcontroller.displayedFriend = selectedFriend
        }
    }
    
}
