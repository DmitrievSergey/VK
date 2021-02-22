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
    //var avaImage: UIImage!

    override init(frame: CGRect) {
      super.init(frame: frame)
        setupView()

    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupView()

    }
    
    func setupView() {
        self.backgroundColor = .white
        self.addSubview(shView)
        self.addSubview(imView)
        shView.backgroundColor = .white
        shView.layer.shadowColor = UIColor.black.cgColor
        shView.layer.shadowOpacity = 0.7
        shView.layer.shadowRadius = 10
        shView.layer.shadowOffset = CGSize.zero
        //shView.layer.masksToBounds = true
        shView.layer.cornerRadius = shView.frame.height / 2
        
        imView.layer.masksToBounds = true
        imView.layer.cornerRadius = imView.frame.height / 2
        //imView.image = avaImage

    }


}
