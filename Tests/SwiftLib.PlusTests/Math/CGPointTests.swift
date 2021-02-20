//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/19/21.
//
import XCTest
@testable import SwiftLib_Plus
import Foundation
import UIKit

final class CGPointTests: XCTestCase {
    
    func testHorizontalDistanceTo() {
        let point1 = CGPoint(x: 1, y: 2)
        let point2 = CGPoint(x: 10, y: 20)
        XCTAssertEqual(point1.horizontalDistanceTo(point2), 9)
        XCTAssertEqual(point2.horizontalDistanceTo(point1), -9)
    }

    func testVerticalDistanceTo() {
        let point1 = CGPoint(x: 1, y: 2)
        let point2 = CGPoint(x: 10, y: 20)
        XCTAssertEqual(point1.verticalDistanceTo(point2), 18)
        XCTAssertEqual(point2.verticalDistanceTo(point1), -18)
    }

    func testDistanceTo() {
        let point1 = CGPoint(x: 1, y: 2)
        let point2 = CGPoint(x: 4, y: 8)
        XCTAssertEqual(point1.distanceTo(point2), 18)
        XCTAssertEqual(point2.distanceTo(point1), -18)
    }
    
}

