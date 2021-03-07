//
//  LoaderView.swift
//  AnimationDZ
//
//  Created by Сергей Дмитриев on 04.03.2021.
//

import UIKit

class LoaderView: UIView {


    private let duration: TimeInterval = 2
    private let delay: TimeInterval = 0.5
    private let alphaV: CGFloat = 0.5
    private let delayDelta: TimeInterval = 0.5
    private let dotViewWidth: CGFloat = 10.0
    private let dotViewHeight: CGFloat = 10.0
    

    
    func setUpViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        dotsStackView.translatesAutoresizingMaskIntoConstraints = false
        firstDotView.translatesAutoresizingMaskIntoConstraints = false
        secondDotView.translatesAutoresizingMaskIntoConstraints = false
        thirdDotView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(dotsStackView)
        dotsStackView.addArrangedSubview(firstDotView)
        dotsStackView.addArrangedSubview(secondDotView)
        dotsStackView.addArrangedSubview(thirdDotView)

        

        
        firstDotView.layer.backgroundColor = UIColor.systemBlue.cgColor
        secondDotView.layer.backgroundColor = UIColor.systemBlue.cgColor
        thirdDotView.layer.backgroundColor = UIColor.systemBlue.cgColor
        
    
        dotsStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dotsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dotsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dotsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        dotsStackView.axis = .horizontal
        dotsStackView.distribution = .equalSpacing
        dotsStackView.alignment = .center
        dotsStackView.spacing = 20
        
        
        setupConstraints(firstDotView)
        setupConstraints(secondDotView)
        setupConstraints(thirdDotView)
        
    }
    
    func animateFirstDot (withDuration duration: TimeInterval, withDelay delay: TimeInterval, withAlpha alphaV: CGFloat) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: [.repeat, .autoreverse],
            animations: {
                self.firstDotView.alpha = self.alphaV
                self.firstDotView.bounds = CGRect(x: Int(self.firstDotView.bounds.width)/2, y: Int(self.firstDotView.bounds.height)/2, width: 1, height: 1)},
            completion: { [self]
                finished in
                animateSecondDot(withDuration: duration, withDelay: delay, withAlpha: alphaV)
            }
        )
    }
    
    func animateSecondDot (withDuration duration: TimeInterval, withDelay delay: TimeInterval, withAlpha alphaV: CGFloat) {
        UIView.animate(
            withDuration: duration,
            delay: delay + 0.5,
            options: [.repeat, .autoreverse],
            animations: {
                self.secondDotView.alpha = self.alphaV
                self.secondDotView.bounds = CGRect(x: Int(self.secondDotView.bounds.width)/2, y: Int(self.secondDotView.bounds.height)/2, width: 1, height: 1)},
            completion: { [self]
                finished in
                animateThirdDot(withDuration: duration, withDelay: delay, withAlpha: alphaV)
            }
        )
    }
    
    func animateThirdDot (withDuration duration: TimeInterval, withDelay delay: TimeInterval, withAlpha alphaV: CGFloat) {
        UIView.animate(
            withDuration: duration,
            delay: delay + 1,
            options: [.repeat, .autoreverse],
            animations: {
                self.thirdDotView.alpha = self.alphaV
                self.thirdDotView.bounds = CGRect(x: Int(self.thirdDotView.bounds.width)/2, y: Int(self.thirdDotView.bounds.height)/2, width: 1, height: 1)},
            completion: { [self]
                finished in
                animateFirstDot(withDuration: duration, withDelay: delay, withAlpha: alphaV)
            }
        )
    }
    
    
    
    func animateThreeDots (withDuration duration: TimeInterval, withDelay delay: TimeInterval, withAlpha alphaV: CGFloat) {
        
        animateFirstDot(withDuration: duration, withDelay: delay, withAlpha: alphaV)
        animateSecondDot(withDuration: duration, withDelay: delay, withAlpha: alphaV)
        animateThirdDot(withDuration: duration, withDelay: delay, withAlpha: alphaV)
        
        
//        UIView.animate(
//            withDuration: duration,
//            delay: delay,
//            options: [.repeat, .autoreverse],
//            animations: {
//                self.firstDotView.alpha = self.alphaV
//                self.firstDotView.bounds = CGRect(x: Int(self.firstDotView.bounds.width)/2, y: Int(self.firstDotView.bounds.height)/2, width: 1, height: 1)}
//        )
//        UIView.animate(
//            withDuration: duration,
//            delay: delay + 0.5,
//            options: [.repeat, .autoreverse],
//            animations: {
//                self.secondDotView.alpha = self.alphaV
//                self.secondDotView.bounds = CGRect(x: Int(self.secondDotView.bounds.width)/2, y: Int(self.secondDotView.bounds.height)/2, width: 1, height: 1)}
//        )
//
//
//        UIView.animate(
//            withDuration: duration,
//            delay: delay + 1,
//            options: [.repeat, .autoreverse],
//            animations: {
//                self.thirdDotView.alpha = self.alphaV
//                self.thirdDotView.bounds = CGRect(x: Int(self.thirdDotView.bounds.width)/2, y: Int(self.thirdDotView.bounds.height)/2, width: 1, height: 1)}
//        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    fileprivate func setupConstraints(_ view: UIView) {
        view.widthAnchor.constraint(equalToConstant: dotViewWidth).isActive = true
        view.heightAnchor.constraint(equalToConstant: dotViewHeight).isActive = true
    }
    
    private var firstDotView: UIView = UIView(frame: .zero)
    private var secondDotView: UIView = UIView(frame: .zero)
    private var thirdDotView: UIView = UIView(frame: .zero)
    private var dotsStackView: UIStackView = UIStackView(frame: .zero)
}
