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
        guard let nav = navigationController else { return 0.0 }
        return nav.navigationBar.frame.height
    }
    
    func statusBarHeight() -> CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
}
