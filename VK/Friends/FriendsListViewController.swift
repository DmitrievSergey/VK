//
//  FriendsListViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit

class FriendsListViewController: UIViewController{

    private var gradient: CAGradientLayer!

    var notSortedArray: Array<Friends> = [
        Friends(friendName: "Alex"), Friends(friendName: "Kate"), Friends(friendName: "Serg"),
        Friends(friendName: "Duke"), Friends(friendName: "Alen"), Friends(friendName: "Nick"),
        Friends(friendName: "Kler"), Friends(friendName: "Karina"), Friends(friendName: "Dobby"),
        Friends(friendName: "Wether"), Friends(friendName: "Argo")
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
        friendTableView.delegate = self
        gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.systemGray6.cgColor]
        gradient.locations = [0,1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.opacity = 0.1
        view.layer.addSublayer(gradient)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

          let label = UILabel()
          label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
          label.text = sectionArray[section]
          label.font = UIFont(name: "System", size: 24) // my custom font
          label.textColor = UIColor.systemOrange // my custom colour

          headerView.addSubview(label)

          return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
        //return CGFloat.leastNonzeroMagnitude
    }

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = .clear
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = view.bounds
//        gradient.colors = [UIColor.systemGray6.cgColor, UIColor.cyan.cgColor]
//        gradient.locations = [0,1]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 0)
//        gradient.opacity = 0.1
//        view.layer.addSublayer(gradient)

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sortedFriends[section].count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellF = friendTableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendCellView
        let friend = sortedFriends[indexPath.section][indexPath.row]
        
        cellF.friendNameLabel.text = friend.friendName
        cellF.friendAvaImage.imageView.image = friend.friendAva
        
        
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
