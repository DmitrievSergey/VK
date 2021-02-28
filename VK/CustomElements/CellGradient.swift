//
//  CellGradient.swift
//  VK
//
//  Created by Сергей Дмитриев on 25.02.2021.
//

import UIKit

class CellGradient: UIView {

    private var shView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    var shRadius: CGFloat = 100
    var shOpacity: Float = 10
    var shColor: UIColor? = .blue
    
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
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
        

        self.gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
        self.gradientLayer.locations = [0 as NSNumber, 1 as NSNumber]
        self.gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        self.gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.gradientLayer.type = .axial




    }


}
