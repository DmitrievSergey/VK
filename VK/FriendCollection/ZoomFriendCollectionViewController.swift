//
//  zoomFriendCollectionViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 09.03.2021.
//

import UIKit

class ZoomFriendCollectionViewController: UIViewController {
    
    var interactiveAnimator: UIViewPropertyAnimator!
    var swipeLeft: UISwipeGestureRecognizer!
    var swipeRight: UISwipeGestureRecognizer!
    
    var myCurrentView = [FriendsCellItem]()
    var index = 0
    var myViews = [FriendsCellItem]()
    

    var images = [FriendsCellItem] ()

    
    @IBOutlet weak var zoomFriendImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)

        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        for image in images {
            image.layer.anchorPoint.x = 0.0
            image.layer.isHidden = true
            //image.layer.anchorPoint.y = 0.0
            image.frame = view.bounds
            view.addSubview(image)
        }
        

        
        for (index, subview) in view.subviews.enumerated() {
            guard let image = subview as? FriendsCellItem else {continue}
            if image.currentImage == true {
                navigationItem.title = image.imageName
                image.layer.isHidden = false
                view.bringSubviewToFront(image)
                
            }
        }
        myViews = view.subviews.compactMap({$0 as? FriendsCellItem}).sorted(by: {$0.imageName < $1.imageName})
        myCurrentView = myViews.filter({$0.currentImage == true})
        index = myViews.lastIndex(of: myCurrentView[0]) ?? 0
        
        

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        self.swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        
    }
    

    
    fileprivate func animatedFromLeft() {
        //animation bring to back
        
        //animation bring to front
        myCurrentView[0].layer.isHidden = false
        let moveView = CGAffineTransform(translationX: -view.bounds.width , y: 0)
        let scaleView = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let movePreviosView = CGAffineTransform(translationX: 2 * view.bounds.width , y: 0)
        let scalePreviosView = CGAffineTransform(scaleX: 0.5, y: 0.5)
        myViews[index].transform = CGAffineTransform(translationX: view.bounds.width / 20, y: 0)
        myCurrentView[0].transform = scaleView.concatenating(moveView)
        
        
        UIView.animate(
            withDuration: 3,
            delay: 0,
            options: .curveEaseInOut,
            animations: { [self] in
                myViews[index].transform = scalePreviosView.concatenating(movePreviosView)
                myCurrentView[0].transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
                myCurrentView[0].transform = .identity
                //[index].transform = .identity
                
            },
            completion: { [self] _ in
                self.myCurrentView[0].transform = .identity
                self.myViews[index].transform = .identity
                self.myViews[index].layer.isHidden = true
                
            }
        )
    }
    
    fileprivate func animatedFromRight() {
        //Animation bring tto front
        //myCurrentView[0].transform = CGAffineTransform(translationX: 2 * view.bounds.width, y: 0)
        myCurrentView[0].layer.isHidden = false
        let moveView = CGAffineTransform(translationX: view.bounds.width , y: 0)
        let scaleView = CGAffineTransform(scaleX: 1, y: 0.5)
        let movePreviosView = CGAffineTransform(translationX: -2 * view.bounds.width , y: 0)
        let scalePreviosView = CGAffineTransform(scaleX: 0.5, y: 0.5)
        myViews[index].transform = CGAffineTransform(translationX: -view.bounds.width / 20, y: 0)
        myCurrentView[0].transform = scaleView.concatenating(moveView)
        
        UIView.animate(
            withDuration: 3,
            delay: 0,
            options: .curveEaseInOut,
            animations: { [self] in
                myViews[index].transform = scalePreviosView.concatenating(movePreviosView)
                myCurrentView[0].transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
                myCurrentView[0].transform = .identity
            },
            completion: { [self] _ in
                self.myCurrentView[0].transform = .identity
                self.myViews[index].transform = .identity
                self.myViews[index].layer.isHidden = true
            }
        )
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer){
        myViews = view.subviews.compactMap({$0 as? FriendsCellItem}).sorted(by: {$0.imageName < $1.imageName})
        myCurrentView = myViews.filter({$0.currentImage == true})
        index = myViews.lastIndex(of: myCurrentView[0]) ?? 0
        
        
        for view in myViews {
            print("ImageName - \(view.imageName), isCurrentImage - \(view.currentImage)")
        }
       
        if myViews.count > 1 {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                print("Swipe Right")
            print(index)
            print(myViews.count - 1)
            if index == 0 {
                myViews[index].currentImage = false
                myViews[myViews.count - 1].currentImage = true
                myCurrentView = myViews.filter({$0.currentImage == true})
                //Animation
                animatedFromLeft()
                // End animation
                navigationItem.title = myCurrentView[0].title
                view.bringSubviewToFront(myCurrentView[0])
  
            } else {

                myViews[index].currentImage = false
                myViews[index - 1].currentImage = true
                myCurrentView = myViews.filter({$0.currentImage == true})
                animatedFromLeft()
                //End Animation
                navigationItem.title = myCurrentView[0].title
                view.bringSubviewToFront(myCurrentView[0])
            }
        } else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
                print("Swipe Left")
            print(index)
            print(myViews.count - 1)
            if index == myViews.count - 1 {
                myViews[index].currentImage = false
                myViews[0].currentImage = true
                myCurrentView = myViews.filter({$0.currentImage == true})
                animatedFromRight()
                //End animation
                navigationItem.title = myCurrentView[0].title
                view.bringSubviewToFront(myCurrentView[0])
  
            } else {

                myViews[index].currentImage = false
                myViews[index + 1].currentImage = true
                myCurrentView = myViews.filter({$0.currentImage == true})
                //Animation bring to front
                animatedFromRight()
                //End animation
                navigationItem.title = myCurrentView[0].title
                view.bringSubviewToFront(myCurrentView[0])
            }

        }
    }

    }
    
}

