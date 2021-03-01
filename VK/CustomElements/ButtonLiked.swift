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
    
    
    var isLiked: Bool = false {
        didSet {
            button.setImage(isLiked ? buttonLikedImage : buttonDislikeImage, for: .normal)
            label.text = isLiked ? "1" : "0"
        }
    }
    private let buttonDislikeImage = UIImage(systemName: "heart")
    private let buttonLikedImage = UIImage(systemName: "heart.fill")
    
    
    var button: UIButton = UIButton(frame: .zero)
    var buttonHeight: CGFloat = 20.0
    
    var label: UILabel = UILabel(frame: .zero)
    var labelHeight: CGFloat = 20.0
    
    var stackView: UIStackView  = UIStackView(frame: .zero)
    
  
    func setInitButtonState () {
        isLiked = false
        label.text = "0"
        label.textColor = .red
        button.setImage(buttonDislikeImage, for: .normal)
    }
    
    @objc func onPress() {
        print("pressed")
        isLiked.toggle()
    }


    
    func setUpView() {
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //self.addSubview(stackView)

        self.addSubview(button)
        self.addSubview(label)
        
        
       

        

        
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: 35).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        button.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
}
