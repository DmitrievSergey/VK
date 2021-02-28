//
//  MyGroupCellViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 19.02.2021.
//

import UIKit

class MyGroupCellViewController: UITableViewCell {

    @IBOutlet weak var myGroupCellImage: CustomAva!
    @IBOutlet weak var myGroupCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

    }

}
