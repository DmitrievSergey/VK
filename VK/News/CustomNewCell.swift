//
//  CustomNewCell.swift
//  VK
//
//  Created by Сергей Дмитриев on 01.03.2021.
//

import UIKit

class CustomNewCell: UITableViewCell {
    
    static let reuseIdentifier = "CustomNewCell"
    static let nibName = "CustomNewCell"
    

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: CustomAva!
    @IBOutlet weak var buttonLiked: ButtonLiked!
    @IBOutlet weak var buttonComented: ButtonLiked!
    @IBOutlet weak var buttonShared: ButtonLiked!
    @IBOutlet weak var buttonViewed: ButtonLiked!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
