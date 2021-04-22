//
//  NavigationController.swift
//  VK
//
//  Created by Сергей Дмитриев on 11.03.2021.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate{
    
    fileprivate var interactivTransitionAnimator = InteractivTransitionAnimator()
    var edgePanGestureRecogniser = UIPanGestureRecognizer()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgePanGestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(edgePanGestureStarted(_ :)))
        //edgePanGestureRecogniser.edges = UIRectEdge.left
        view.addGestureRecognizer(edgePanGestureRecogniser)
        edgePanGestureRecogniser.delegate = self
        delegate = self
        // Do any additional setup after loading the view.
    }
    
    @objc private func edgePanGestureStarted(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .recognized {
            print("Screen edge swiped!")
        }
        switch recognizer.state {
        case .began:
            interactivTransitionAnimator.hasStarted = true
            popViewController(animated: true)
        case .changed:
            let totalGestureDistance: CGFloat = 200
            let distance = recognizer.translation(in: recognizer.view?.superview).x
            let relativeDistance = distance / totalGestureDistance
            let progress = max(0, min(1, relativeDistance))
            
            interactivTransitionAnimator.update(progress)
            interactivTransitionAnimator.shouldFinish = progress > 0.35
        case .ended:
            interactivTransitionAnimator.hasStarted = false
            
            if interactivTransitionAnimator.shouldFinish {
                interactivTransitionAnimator.finish()
            } else {
                interactivTransitionAnimator.cancel()
            }
        case .cancelled:
            interactivTransitionAnimator.hasStarted = false
            interactivTransitionAnimator.cancel()
        default:
            break
        }
    }

    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return CustomPushAnimator()
        } else if operation == .pop {
            return CustomPopAnimator()
        }
        return nil
    }
    
    func navigationController(_
                                navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactivTransitionAnimator.hasStarted ? interactivTransitionAnimator : nil
    }

}

