//
//  AnimationControllerForNavigator.swift
//  VK
//
//  Created by Сергей Дмитриев on 11.03.2021.
//

import UIKit

class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPoint(x: view.bounds.size.width * anchorPoint.x,
                               y: view.bounds.size.height * anchorPoint.y)


        var oldPoint = CGPoint(x: view.bounds.size.width * view.layer.anchorPoint.x,
                               y: view.bounds.size.height * view.layer.anchorPoint.y)

        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)

        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 6.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else {return}
        
        let containerView = transitionContext.containerView
        //let finalFrame = transitionContext.finalFrame(for: destination)
        
        containerView.addSubview(destination.view)
        setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0), forView: source.view)
        setAnchorPoint(anchorPoint: CGPoint(x: 1, y: 0), forView: destination.view)
        

        let destinationRotate = CGAffineTransform(rotationAngle: -.pi / 2)
        destination.view.transform = destinationRotate

        
        let duration = transitionDuration(using: transitionContext)
        

        UIView.animateKeyframes(
          withDuration: duration,
          delay: 0,
            options: .calculationModeCubicPaced,
          animations: {

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75) {
                
                let rotate = CGAffineTransform(rotationAngle: .pi / 2)
                source.view.transform = rotate
            }

            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                destination.view.transform = .identity
            }
        },

          completion: { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
                destination.view.transform = .identity
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
        )
    }
}
class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPoint(x: view.bounds.size.width * anchorPoint.x,
                               y: view.bounds.size.height * anchorPoint.y)


        var oldPoint = CGPoint(x: view.bounds.size.width * view.layer.anchorPoint.x,
                               y: view.bounds.size.height * view.layer.anchorPoint.y)

        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)

        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        3.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
            guard let destination = transitionContext.viewController(forKey: .to) else { return }
            
            transitionContext.containerView.addSubview(destination.view)
            transitionContext.containerView.sendSubviewToBack(destination.view)
            
            destination.view.frame = source.view.frame
        
            setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0), forView: destination.view)
            setAnchorPoint(anchorPoint: CGPoint(x: 1, y: 0), forView: source.view)
            
        let rotate = CGAffineTransform(rotationAngle: .pi/2)
            destination.view.transform = rotate
            
            UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                    delay: 0,
                                    options: .calculationModePaced,
                                    animations: {
                                        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75) {
                                            
                                            let rotate = CGAffineTransform(rotationAngle: -.pi / 2)
                                            source.view.transform = rotate
                                        }

                                        UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                                            destination.view.transform = .identity
                                        }
                                    },

                                      completion: { finished in
                                        if finished && !transitionContext.transitionWasCancelled {
                                            source.view.transform = .identity
                                            destination.view.transform = .identity
                                        } else if transitionContext.transitionWasCancelled{
                                            source.view.transform = .identity
                                            destination.view.transform = .identity
                                        }
                                        transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
                                    }
            )
    
    }
}
