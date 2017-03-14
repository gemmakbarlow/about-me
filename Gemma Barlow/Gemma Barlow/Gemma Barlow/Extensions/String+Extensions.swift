//
//  String+Extensions.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import Foundation

extension String {
    
    /**
    If the char 'delimiter' exists in the String, truncate everything before it.
    Can be used to easily remove the Module name from a class.
    
    - parameter delimiter: String denoting the point prior to which all characters should be removed from the String
    
    - returns: Truncated string, or original string if the delimiter could not be found.
    */
    func truncatePriorToChar(_ delimiter: String) -> String {
        var final = self
        if let range = final.range(of: delimiter, options: .backwards) {
            let substringIndex = index(range.lowerBound, offsetBy: 1)
            final = final.substring(from: substringIndex)
        }
        return final
    }
}
