//
//  ButtonLiked.swift
//  VK
//
//  Created by Сергей Дмитриев on 22.02.2021.
//

import UIKit

class ButtonLiked: UIView {
    
    var buttonOnImage: UIImage = UIImage()
    var buttonOffImage: UIImage = UIImage()
    var countLabel: UILabel = UILabel(frame: .zero)
    private var button: UIButton = UIButton(frame: .zero)
    
    
    var isPressed: Bool = false {
        didSet {
            button.setImage(isPressed ? buttonOnImage : buttonOffImage, for: .normal)
            countLabel.text = isPressed ? "1" : "0"
        }
    }

    
    var stackView: UIStackView  = UIStackView(frame: .zero)
    
    
    @objc func onPress() {
        print("pressed")
        isPressed.toggle()
    }


    
    func setUpView() {
        button.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //self.addSubview(stackView)

        self.addSubview(button)
        self.addSubview(countLabel)
        
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        countLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: 35).isActive = true
        countLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        button.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
}
