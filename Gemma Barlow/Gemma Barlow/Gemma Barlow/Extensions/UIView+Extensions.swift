//
//  UIView+Extensions.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/21/15.
//
//

import UIKit


let ShowViewAlpha: CGFloat = 1.0
let HideViewAlpha: CGFloat = 0.0

private let FadeAnimationDuration: NSTimeInterval = 0.3

extension UIView {
    
    // MARK: - Animation
    
    func fadeInView(view: UIView, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void)?) {
        view.alpha = HideViewAlpha
        
        UIView.animateWithDuration(FadeAnimationDuration, delay: delay, options: .CurveEaseIn, animations: {
            view.alpha = ShowViewAlpha
        }, completion: completion)
    }
}

