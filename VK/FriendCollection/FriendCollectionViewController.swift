//
//  FirendCollectionViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit



class FriendCollectionViewController: UICollectionViewController {
    var displayedFriend: Friends?
    override func viewDidLoad() {
        super.viewDidLoad()

       
        title = "\(displayedFriend?.friendName ?? "Anonym") Collection" 

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if let friend = displayedFriend {
            return friend.friendCollection.count
        } else {return 0}
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCellCollection", for: indexPath) as! FriendCollectionCellView
        guard let friend = displayedFriend else {return UICollectionViewCell()}
        cell.imageCellCollection.image = UIImage(named: friend.friendCollection[indexPath.row])
        cell.configureButtonLike()
        return cell
    }

}
