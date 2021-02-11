//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/11/21.
//
import Foundation

/**
 Used to track the performance of a block of code.
 
 - parameter description: Description of the performance timer being run, used when outputting to log
 - parameter warningTimeMs: If the time exceeds this value in milliseconds a log message will be generated
 - parameter block: Block to execute once (default is @noescape means the closure won't get called outside the context of this method.)
 */
public func performanceTimer(description: String, warningTimeMs : Double? = nil, block: () -> ()) -> Double
{
    let start = DispatchTime.now() // <<<<<<<<<< Start time
    block()
    let end = DispatchTime.now()   // <<<<<<<<<<   end time

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeMs = Double(nanoTime) / 1_000_000   // inf if overflow

    if let warningTimeMs = warningTimeMs, timeMs > warningTimeMs  {
        print("WARNING: \(description) completion time of \(timeMs)ms exceeded \(warningTimeMs)ms")
    }
    
    return timeMs
}
