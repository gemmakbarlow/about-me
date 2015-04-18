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

    class func mauveColor() -> UIColor {
        return UIColor(hexValue: 0xa1b4cc)
    }
    
    class func oceanBlueColor() -> UIColor {
        return UIColor(hexValue: 0x185674)
    }
    
    class func paleYellowColor() -> UIColor {
        return UIColor(hexValue: 0xf6f698)
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