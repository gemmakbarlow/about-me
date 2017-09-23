//
//  SubstringTests.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit
import XCTest
import Gemma_Barlow

class SubstringTests: XCTestCase {

    func testSubstringPriorToCharNoChar() {
        XCTAssertEqual("Gemma Barlow", "Gemma Barlow".truncatePriorToAndIncludingChar(""))
    }
    
    func testSubstringPriorToCharDot() {
        XCTAssertEqual("Barlow", "Gemma.Barlow".truncatePriorToAndIncludingChar("."))
    }
    
    func testSubstringPriorToLast() {
        XCTAssertEqual("", "HiThereGemma".truncatePriorToAndIncludingChar("a"))
    }
}
