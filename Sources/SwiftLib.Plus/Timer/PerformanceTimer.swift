//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/11/21.
//
import Foundation



public func performanceTimer(block: () -> ()) -> Double
{
    let start = DispatchTime.now() // <<<<<<<<<< Start time
    block()
    let end = DispatchTime.now()   // <<<<<<<<<<   end time

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeMs = Double(nanoTime) / 1_000_000   // inf if overflow

    print("Completed in \(timeMs)ms")
    return timeMs
}
