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
    private var tap: UITapGestureRecognizer!
    
    var Image: UIImage!
    var images: [String]!
    var currentImageName: String!


    
    @IBOutlet weak var zoomFriendImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomFriendImage.image = Image
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)

        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
//        view.addGestureRecognizer(swipe)
//        swipe.direction = [.left, .right, .down, .up]
        view.addGestureRecognizer(tap)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        self.swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        
    }
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                print("Swipe Right")
            
            var currentIndex = getCurrentIndexByName(currentImageName)
            if currentIndex == images.count - 1 {
                currentIndex = 0
                currentImageName = images[0]
                zoomFriendImage.image = UIImage(named: currentImageName)
            } else {
                currentIndex += 1
                currentImageName = images[currentIndex]
                zoomFriendImage.image = UIImage(named: currentImageName)
            }

        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
                print("Swipe Left")
            var currentIndex = getCurrentIndexByName(currentImageName)
            if currentIndex == 0 {
                currentIndex = images.count - 1
                currentImageName = images[currentIndex]
                zoomFriendImage.image = UIImage(named: currentImageName)
            } else {
                currentIndex -= 1
                currentImageName = images[currentIndex]
                zoomFriendImage.image = UIImage(named: currentImageName)
            }

            }

        }
    
    @objc func onTap(_ gesture: UITapGestureRecognizer) {

    }
    
    func getCurrentIndexByName(_ name: String) -> Int{
        var currentIndex = 0
        for i in 0...images.count - 1  {
            if name == images[i] {
                currentIndex = i
                break
            }
        }
        return currentIndex
    }
    
}

