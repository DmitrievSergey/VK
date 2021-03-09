//
//  FirendCollectionViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit



class FriendCollectionViewController: UICollectionViewController {

    var selectedImage: UIImage!
    var collectionImages: [UIImage]!
    var displayedFriend: Friends?
    
    @IBOutlet var friendCollectionView: UICollectionView!
    
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "zoomFriendCollection" {
            let cell = sender as! FriendCollectionCellView
            if let friend = displayedFriend,
            let indexPath = self.friendCollectionView.indexPath(for: cell),
            let zoomImageView = segue.destination as? ZoomFriendCollectionViewController {
                selectedImage = UIImage(named: (friend.friendCollection[indexPath.row]))
                zoomImageView.Image = selectedImage
                zoomImageView.images = friend.friendCollection
                zoomImageView.currentImageName = friend.friendCollection[indexPath.row]

            }
        }
    }
}
