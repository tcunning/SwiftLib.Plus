//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/19/21.
//
import Foundation

/**
    See https://forums.swift.org/t/floatingpoint-equality/6233/2
 */
public func almostEqual<TValue: FloatingPoint>(_ valueA: TValue, _ valueB: TValue) -> Bool {
    return valueA >= valueB.nextDown && valueA <= valueB.nextUp
}
