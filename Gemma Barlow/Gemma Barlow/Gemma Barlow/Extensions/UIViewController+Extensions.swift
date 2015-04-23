//
//  UIViewController+Extensions.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/22/15.
//
//

import Foundation
import UIKit

extension UIViewController {
    
    
    // MARK: - Other
    
    func navigationBarHeight() -> CGFloat {
        if let c = navigationController {
            return c.navigationBar.frame.height
        }
        else {
            return 0.0
        }
    }
    
    func statusBarHeight() -> CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.size.height
    }
    
}