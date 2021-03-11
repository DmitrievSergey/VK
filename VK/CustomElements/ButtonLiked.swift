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
    var button: UIButton = UIButton(frame: .zero)
    
    
    var isPressed: Bool = false{
        didSet {
            button.setImage(isPressed ? buttonOnImage : buttonOffImage, for: .normal)
            countLabel.text = isPressed ? "1" : "0"
        }
    }

    
    func animateButtonLike () {
        
        print("Зашли внутрь функции ButtonLiked")
        if isPressed == true {
            
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.8,
                options: [.autoreverse, .curveEaseInOut],
                animations: { [self]
                    in
                    button.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                    UIView.transition(
                        with: countLabel,
                        duration: 6,
                        options: .transitionFlipFromLeft,
                        animations: {
                            countLabel.text = "1"
                        },
                        completion: nil)
                },
                completion: { [self]
                    finished in
                    button.transform = CGAffineTransform.identity
                })
        }
        else {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.8,
                options: [.autoreverse, .curveEaseInOut],
                animations: { [self]
                    in
                    button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                    UIView.transition(
                        with: countLabel,
                        duration: 6,
                        options: .transitionFlipFromLeft,
                        animations: {
                            countLabel.text = "0"
                        },
                        completion: nil)
                },
                completion: { [self]
                    finished in
                    button.transform = CGAffineTransform.identity
                })
        }
    }
    
    
    



    
    func setUpView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(countLabel)


        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5
        
        setupConstraints(button)

        
        button.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    private var stackView: UIStackView  = UIStackView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    fileprivate func setupConstraints(_ view: UIView) {
        view.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        view.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
    }
    
    
   @objc func onPress() {
        print("pressed")
        isPressed.toggle()
        animateButtonLike()

    }
    
    private let viewWidth: CGFloat = 16.0
    private let viewHeight: CGFloat = 16.0
}

