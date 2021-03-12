//
//  NavigationController.swift
//  VK
//
//  Created by Сергей Дмитриев on 11.03.2021.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate{
    
    fileprivate var interactivTransitionAnimator = InteractivTransitionAnimator()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let edgePanGestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(edgePanGestureStarted(_ :)))
        //edgePanGestureRecogniser = .left
        view.addGestureRecognizer(edgePanGestureRecogniser)
        
        delegate = self
        // Do any additional setup after loading the view.
    }
    
    @objc private func edgePanGestureStarted(_ recogniser: UIPanGestureRecognizer) {
        print("hello there!")
        switch recogniser.state {
        case .began:
            interactivTransitionAnimator.hasStarted = true
            popViewController(animated: true)
        case .changed:
            let totalGestureDistance: CGFloat = 200
            let distance = recogniser.translation(in: recogniser.view?.superview).x
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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

