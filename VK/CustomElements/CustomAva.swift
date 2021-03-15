//
//  CustomAva.swift
//  VK
//
//  Created by Сергей Дмитриев on 21.02.2021.
//
import UIKit

class CustomAva: UIView {

    var avaIsPressed: Bool = false
    
    var avaImage: UIImage = UIImage()
    
    var cornerRadius: CGFloat {
        get {return self.bounds.size.width / 2}
        set {self.layer.cornerRadius  = newValue}
    }
    
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
           return shadowView.layer.shadowRadius
        }
        set {
            shadowView.layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOpacity: Float {
        get {
           return shadowView.layer.shadowOpacity
        }
        set {
            shadowView.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: shadowView.layer.shadowColor ?? UIColor.clear.cgColor)
        }
        set {
            shadowView.layer.shadowColor = newValue?.cgColor
        }
    }
    
    override func layoutSubviews() {
        imageView.image = avaImage
    }

    func animateCustomAva () {
        print("Зашли внутрь функции")
        self.addGestureRecognizer(tap)
        
        if avaIsPressed {
            print("avaIsPressed")
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 5,
            initialSpringVelocity: 1,
            options: [.curveEaseInOut, .autoreverse],
            animations: { [self]
                in
                imageView.layer.bounds = CGRect(x: 0, y: 0, width: bounds.size.width * 0.7, height: bounds.size.width * 0.7)
                imageView.layer.cornerRadius = bounds.size.width * 0.7 / 2
                shadowView.layer.shadowColor = UIColor.red.cgColor
                shadowView.layer.cornerRadius = bounds.size.width * 0.7 / 2
                shadowView.layer.bounds = CGRect(x: 0, y: 0, width: bounds.size.width * 0.7, height: bounds.size.width * 0.7)
                
            },

            completion: { [self]
                finished in
                print("Ava is pressed!!")
                imageView.layer.bounds = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.width)
                imageView.layer.cornerRadius = bounds.size.width / 2
                shadowView.layer.shadowColor = UIColor.black.cgColor
                shadowView.layer.cornerRadius = bounds.size.width / 2
                shadowView.layer.bounds = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.width)
            }
        )
            
       }
        print("Вышли из функции")

    }
    
    func addCustomAva (withImage image: UIImage, withShadowColor shadowColor: UIColor, withCornerRadius cornerRadius: CGFloat) {
        
    }
    
    func setupView() {
        self.backgroundColor = .clear
        self.addSubview(shadowView)
        self.addSubview(imageView)
        
        setupConstraint(shadowView)
        setupConstraint(imageView)

        
        shadowView.backgroundColor = .white
        shadowView.layer.shadowColor = shadowColor?.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.cornerRadius = cornerRadius
        

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = cornerRadius
       
    }
    
    private var imageView: UIImageView = UIImageView(frame: .zero)
    private var shadowView: UIView = UIView(frame: .zero)
    
    private var tap: UITapGestureRecognizer!

    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupView()
        tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        animateCustomAva()
    }
    
    fileprivate func setupConstraint(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    }
    


    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        avaIsPressed = true
        animateCustomAva()
    }
}

