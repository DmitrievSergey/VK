//
//  GroupsTableViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 19.02.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    let groupsList = [
        Group(groupName: "name1", groupAva: "groupAva1"),
        Group(groupName: "name2", groupAva: "groupAva2"),
        Group(groupName: "name3", groupAva: "groupAva3"),
        Group(groupName: "name4", groupAva: "groupAva4"),
        Group(groupName: "name5", groupAva: "groupAva5"),
        Group(groupName: "name6", groupAva: "groupAva6"),
        Group(groupName: "name7", groupAva: "groupAva7"),
        Group(groupName: "name8", groupAva: "groupAva8"),
        Group(groupName: "name9", groupAva: "groupAva9"),
        Group(groupName: "name10", groupAva: "groupAva10"),
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupCellViewController

        cell.groupCellLabel.text = groupsList[indexPath.row].groupName
        cell.groupCellImage.imView.image = UIImage(named: groupsList[indexPath.row].groupAva)

        return cell
    }
}
