//
//  CustomNewCell.swift
//  VK
//
//  Created by Сергей Дмитриев on 01.03.2021.
//

import UIKit

class CustomNewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let reuseIdentifier = "CustomNewCell"
    static let nibName = "CustomNewCell"
    

    @IBOutlet weak var newPhotoCollectionView: UICollectionView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: CustomAva!
    @IBOutlet weak var buttonLiked: ButtonLiked!
    @IBOutlet weak var buttonComented: ButtonLiked!
    @IBOutlet weak var buttonShared: ButtonLiked!
    @IBOutlet weak var buttonViewed: ButtonLiked!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.newPhotoCollectionView.dataSource = self
        self.newPhotoCollectionView.delegate = self
        self.newPhotoCollectionView.register(UINib(nibName: "NewCollectionCell", bundle: nil), forCellWithReuseIdentifier: "NewCollectionCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with new: New) {
        textView.text = new.text
        nameLabel.text = "Какой то аватар"
    }
    
    func configureLowBar () {
        configureButtonLike()
        configureButtonComented()
        configureButtonShared()
        configureButtonViewed()
    }
    
    func configureButtonLike() {
        buttonLiked.buttonOffImage = UIImage(systemName: "heart")!
        buttonLiked.buttonOnImage = UIImage(systemName: "heart.fill")!
        buttonLiked.isPressed = false
        buttonLiked.countLabel.text = "0"
        buttonLiked.countLabel.textColor = .red
    }
    
    func configureButtonComented() {
        buttonComented.buttonOffImage = UIImage(systemName: "checkmark.seal")!
        buttonComented.buttonOnImage = UIImage(systemName: "checkmark.seal.fill")!
        buttonComented.isPressed = false
        buttonComented.countLabel.text = "0"
        buttonComented.countLabel.textColor = .red
    }
    
    func configureButtonShared() {
        buttonShared.buttonOffImage = UIImage(systemName: "arrowshape.turn.up.right")!
        buttonShared.buttonOnImage = UIImage(systemName: "arrowshape.turn.up.right.fill")!
        buttonShared.isPressed = false
        buttonShared.countLabel.text = "0"
        buttonShared.countLabel.textColor = .red
    }
    
    func configureButtonViewed() {
        buttonViewed.buttonOffImage = UIImage(systemName: "eye")!
        buttonViewed.buttonOnImage = UIImage(systemName: "eye.fill")!
        buttonViewed.isPressed = false
        buttonViewed.countLabel.text = "0"
        buttonViewed.countLabel.textColor = .red
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionCell", for: indexPath) as? NewCollectionCell else
        {return UICollectionViewCell()}
        
        cell.imageNewCollectionCell.image = UIImage(named: "Alex")
        
        
        return cell
    }
}

