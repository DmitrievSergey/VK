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
    
    var button: UIButton = UIButton(frame: CGRect(x: 80, y: -5, width: 20, height: 20))
    
    var label: UILabel = UILabel(frame: CGRect(x: 110, y: -5, width: 20, height: 20))
    
    var isLiked: Bool = false
    
  
    @objc func onPress() {
        print("pressed")
        if isLiked == true {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            label.text = "0"
            isLiked = false
        } else {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            label.text = "1"
            isLiked = true
        }
    }


    
    func setUpView() {

        self.addSubview(button)
        self.addSubview(label)
        
        label.text = "0"
        label.textColor = .red
        
        
        //button.backgroundColor = .red
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        //button.setTitle("MyButton", for: .normal)
        //button.setTitleColor(.white, for: .normal)
       // button.layer.cornerRadius = button.frame.height / 2

        button.addTarget(self, action: #selector(onPress), for: .touchUpInside)

        
    }


}
