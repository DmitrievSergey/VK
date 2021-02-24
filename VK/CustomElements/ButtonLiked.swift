//
//  ButtonLiked.swift
//  VK
//
//  Created by Сергей Дмитриев on 22.02.2021.
//

import UIKit

class ButtonLiked: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    
    var isLiked: Bool = false
    private let buttonDislikeImage = UIImage(systemName: "heart")
    private let buttonLikedImage = UIImage(systemName: "heart.fill")
    
    
    var button: UIButton = UIButton(frame: CGRect(x: 80, y: -5, width: 20, height: 20))
    
    var label: UILabel = UILabel(frame: CGRect(x: 110, y: -5, width: 20, height: 20))
    
  
    func setInitButtonState () {
        isLiked = false
        label.text = "0"
        button.setImage(buttonDislikeImage, for: .normal)
    }
    
    @objc func onPress() {
        print("pressed")
        if isLiked == true {
            button.setImage(buttonDislikeImage, for: .normal)
            label.text = "0"
            isLiked = false
        } else {
            button.setImage(buttonLikedImage, for: .normal)
            label.text = "1"
            isLiked = true
        }
    }


    
    func setUpView() {

        self.addSubview(button)
        self.addSubview(label)
        
        label.text = "0"
        label.textColor = .red
        
        button.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
}
