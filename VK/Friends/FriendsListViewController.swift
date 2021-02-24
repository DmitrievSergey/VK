//
//  FriendsListViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit

class FriendsListViewController: UIViewController {
    
    var notSortedArray: Array<Friends> = [
        Friends(friendName: "Alex"), Friends(friendName: "Kate"), Friends(friendName: "Serg"),
        Friends(friendName: "Duke"), Friends(friendName: "Alen"), Friends(friendName: "Nick"),
        Friends(friendName: "Kler")
    ]
    
    var sectionArray: Array<String> {
        let sortedArray = notSortedArray.sorted{$0.friendName < $1.friendName}
        var sectionArray: [String] = []
        for friend in sortedArray {
            if !friend.friendName.isEmpty {
                if !sectionArray.contains(friend.friendName.first!.description){
                    sectionArray.append(friend.friendName.first!.description)
                }
            }
        }
        return sectionArray
    }

    
    var sortedFriends: Array<Array<Friends>> {
        let sortedArray = notSortedArray.sorted{$0.friendName < $1.friendName}
        var friendsArray: Array<Array<Friends>> = Array<Array<Friends>>()
        var letterFriendsArray: Array<Friends> = []
        for letter in sectionArray {
            for friend in sortedArray {
                if !friend.friendName.isEmpty {
                    if friend.friendName.starts(with: letter) {
                        letterFriendsArray.append(friend)
                    }
                }
            }
            friendsArray.append(letterFriendsArray)
            letterFriendsArray = []
        }
        return friendsArray
    }
    

    
    @IBOutlet var friendTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        friendTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
}
extension FriendsListViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {

        return sectionArray.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {

        return sectionArray
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.sectionArray[section]
    
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.font = UIFont(name: "System.Bold", size: 50)
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sortedFriends[section].count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellF = friendTableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendCellView

        let friend = sortedFriends[indexPath.section][indexPath.row]
        
        cellF.friendNameLabel.text = friend.friendName
        cellF.friendAvaImage.imView.image = friend.friendAva

        return cellF
    }
    
    
    //MARK: - Segue
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToFriendCollectionSegue",
               let senderCell = sender as? FriendCellView,
               let cellIndexPath = friendTableView.indexPath(for: senderCell),
               let friendCollectionViewcontroller = segue.destination as? FriendCollectionViewController {
                let selectedFriend = sortedFriends[cellIndexPath.section][cellIndexPath.row]
                friendCollectionViewcontroller.displayedFriend = selectedFriend
            }
        }
    //MARK: - TableView delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
    }
}
