//
//  CustomAva.swift
//  VK
//
//  Created by Сергей Дмитриев on 21.02.2021.
//
import UIKit

class CustomAva: UIView {

    var imView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    private var shView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    @IBInspectable
    var shRadius: CGFloat {
        get {
           return shView.layer.shadowRadius
        }
        set {
            shView.layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shOpacity: Float {
        get {
           return shView.layer.shadowOpacity
        }
        set {
            shView.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shColor: UIColor? {
        get {
           return UIColor(cgColor: shView.layer.shadowColor!)
        }
        set {
            shView.layer.shadowColor = newValue?.cgColor
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
    
    func setupView() {
        self.backgroundColor = .clear
        self.addSubview(shView)
        self.addSubview(imView)
        shView.backgroundColor = .white
        shView.layer.shadowColor = shColor?.cgColor
        shView.layer.shadowOpacity = shOpacity
        shView.layer.shadowRadius = shRadius
        shView.layer.shadowOffset = CGSize.zero
        shView.layer.cornerRadius = shView.frame.height / 2
        
        imView.layer.masksToBounds = true
        imView.layer.cornerRadius = imView.frame.height / 2


    }


}
