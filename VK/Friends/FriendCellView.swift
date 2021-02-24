//
//  FriendCellView.swift
//  VK
//
//  Created by Сергей Дмитриев on 18.02.2021.
//

import UIKit

class FriendCellView: UITableViewCell {

    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendAvaImage: CustomAva!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
