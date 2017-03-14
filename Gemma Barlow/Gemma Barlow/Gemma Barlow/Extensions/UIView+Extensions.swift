//
//  UIView+Extensions.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/21/15.
//
//

import UIKit

enum Alpha: CGFloat {
    case show = 1.0
    case hide = 0.0
}

private let fadeAnimationDuration: TimeInterval = 0.3

extension UIView {
    
    // MARK: - Animation
    
    func fadeInView(_ view: UIView, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)?) {
        view.alpha = Alpha.hide.rawValue
        
        UIView.animate(withDuration: fadeAnimationDuration, delay: delay, options: .curveEaseIn, animations: {
            view.alpha = Alpha.show.rawValue
        }, completion: completion)
    }
}

