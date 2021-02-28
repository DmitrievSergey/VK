//
//  MyGroupTableViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 19.02.2021.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    var myGroupArray:[Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        

        return myGroupArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as! MyGroupCellViewController

        cell.myGroupCellLabel.text = myGroupArray[indexPath.row].groupName
        
        cell.myGroupCellImage.imageView.image = UIImage(named: myGroupArray[indexPath.row].groupAva) 
    
        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            myGroupArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

 
    //MARK: - Segue
    @IBAction func addGroup (segue: UIStoryboardSegue){
        
        if segue.identifier == "addGroup" {
            guard let groupsTableViewController = segue.source as? GroupsTableViewController else {return}
            if let indexPath = groupsTableViewController.tableView.indexPathForSelectedRow{
                let group = groupsTableViewController.groupsList[indexPath.row]
                if !myGroupArray.contains(group){
                    myGroupArray.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
}
