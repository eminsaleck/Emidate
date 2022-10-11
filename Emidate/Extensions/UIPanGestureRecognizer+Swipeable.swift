//
//  UIPanGestureRecognizer+Swipeable.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 11.10.2022.
//

import UIKit

protocol Swipeable {
    
    
}

extension UIGestureRecognizerDelegate{
    
}
extension Swipeable where Self: StackContainerView{
    
}

extension Swipeable where Self: UIPanGestureRecognizer{
    
    
    func swipe(_ card: UIView, _ view: UIView, loveOrHate: Bool){
        
        
        let point = self.translation(in: view)
        
        let centerOfParentContainer = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y)
        
        if loveOrHate {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: []) {
                card.center = CGPoint(x: centerOfParentContainer.x + point.x + 200, y: centerOfParentContainer.y + point.y + 75)
                card.alpha = 0
                
                view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: []) {
                card.center = CGPoint(x: centerOfParentContainer.x + point.x - 200, y: centerOfParentContainer.y + point.y + 75)
                card.alpha = 0
                view.layoutIfNeeded()
            }
        }
    }
    
    func center(_ card: UIView){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: []) {
            card.transform = .identity
            card.center = CGPoint(x: card.frame.width / 2, y: card.frame.height / 2)
            card.layoutIfNeeded()
        }
    }
    
    func swipeView(_ view: UIView){
        let card = self.view as! SwipeCardView
        let point = self.translation(in: view)
        let centerOfParentContainer = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y)
        
        switch self.state {
        case .ended:
            if (card.center.x) > 330 {
                swipe(card, view, loveOrHate: true)
                return
            }else if card.center.x < 0 {
                swipe(card, view, loveOrHate: false)
                return
            }
            
        case .changed:
            let rotation = tan(point.x / (view.frame.width * 2.0))
            card.transform = CGAffineTransform(rotationAngle: rotation)
            
        default:
            break
        }
        return
    }
}


extension UIPanGestureRecognizer: Swipeable {}


