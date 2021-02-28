//
//  CustomAva.swift
//  VK
//
//  Created by Сергей Дмитриев on 21.02.2021.
//
import UIKit

class CustomAva: UIView {

    var imageView: UIImageView = UIImageView(frame: .zero)
        //UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    private var shadowView: UIView = UIView(frame: .zero)
        //UIView = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    
    var cornerRadius: CGFloat {
        get {return self.bounds.height / 2}
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

    override init(frame: CGRect) {
      super.init(frame: frame)
        setupView()

    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupView()

    }
    
    fileprivate func setupConstraint(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
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


}
