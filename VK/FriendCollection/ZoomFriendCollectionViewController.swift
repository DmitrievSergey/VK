//
//  zoomFriendCollectionViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 09.03.2021.
//

import UIKit

class ZoomFriendCollectionViewController: UIViewController {
    
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
            image.layer.anchorPoint.y = 0.0
            image.frame = view.bounds
            view.addSubview(image)
        }
        

        
        for (index, subview) in view.subviews.enumerated() {
            guard let image = subview as? FriendsCellItem else {continue}
            if image.currentImage == true {
                navigationItem.title = image.imageName
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
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer){
        myViews = view.subviews.compactMap({$0 as? FriendsCellItem}).sorted(by: {$0.imageName < $1.imageName})
        myCurrentView = myViews.filter({$0.currentImage == true})
        index = myViews.lastIndex(of: myCurrentView[0]) ?? 0
        
        
        for view in myViews {
            print("ImageName - \(view.imageName), isCurrentImage - \(view.currentImage)")
        }
       

        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                print("Swipe Right")
            print(index)
            print(myViews.count - 1)
            if index == 0 {
                myViews[index].currentImage = false
                myViews[myViews.count - 1].currentImage = true
                myCurrentView = myViews.filter({$0.currentImage == true})
                navigationItem.title = myCurrentView[0].title
                view.bringSubviewToFront(myCurrentView[0])
  
            } else {

                myViews[index].currentImage = false
                print(myViews[index])
                print(myCurrentView)
                myViews[index - 1].currentImage = true
                myCurrentView = myViews.filter({$0.currentImage == true})
                print(myViews[index - 1])
                print(myCurrentView)
                navigationItem.title = myCurrentView[0].title
                view.bringSubviewToFront(myCurrentView[0])
            }
            for view in myViews {
                print("ImageName - \(view.imageName), isCurrentImage - \(view.currentImage)")
            }
        }else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
                print("Swipe Left")
            print(index)
            print(myViews.count - 1)
            if index == myViews.count - 1 {
                myViews[index].currentImage = false
                myViews[0].currentImage = true
                myCurrentView = myViews.filter({$0.currentImage == true})
                navigationItem.title = myCurrentView[0].title
                view.bringSubviewToFront(myCurrentView[0])
  
            } else {

                myViews[index].currentImage = false
                print(myViews[index])
                print(myCurrentView)
                myViews[index + 1].currentImage = true
                myCurrentView = myViews.filter({$0.currentImage == true})
                print(myViews[index + 1])
                print(myCurrentView)
                navigationItem.title = myCurrentView[0].title
                view.bringSubviewToFront(myCurrentView[0])
            }
            for view in myViews {
                print("ImageName - \(view.imageName), isCurrentImage - \(view.currentImage)")
            }

        }

    }
    

    
//    func getCurrentIndexByName(_ name: String) -> Int{
//        var currentIndex = 0
//        for i in 0...images.count - 1  {
//            if name == images[i] {
//                currentIndex = i
//                break
//            }
//        }
//        return currentIndex
//    }
    
}

