//
//  FriendCellView.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit

class FriendCellView: UITableViewCell {
    
    private var tap: UITapGestureRecognizer!

    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendAvaImage: CustomAva!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendAvaImage.addGestureRecognizer(tap)
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureAvatar ( with friend: Friends) {
        friendNameLabel.text = friend.friendName
        friendAvaImage.avaImage = friend.friendAva
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tap = UITapGestureRecognizer(target: self, action: #selector(friendAvaImage.handleTap(_:)))
        
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        friendAvaImage.avaIsPressed = true
        friendAvaImage.animateCustomAva()
    }

}


