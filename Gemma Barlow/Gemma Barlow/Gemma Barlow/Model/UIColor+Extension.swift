//
//  UIColor+Extension.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

extension UIColor {
    
    // MARK: - Custom Colors
    
    class func tealColor() -> UIColor {
        return UIColor(hexValue: 0x70bfb5)
    }

    class func paleBlueColor() -> UIColor {
        return UIColor(hexValue: 0x9dd1ed)
    }
    
    class func backgroundGrayColor() -> UIColor {
        return UIColor(hexValue: 0x363636)
    }
    
    // MARK: - Hex Initializer
    
    convenience init(hexValue: UInt) {
        self.init(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
