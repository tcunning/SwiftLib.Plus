//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/19/21.
//
import Foundation
import UIKit

extension CGPoint {
    /**
        Uses patharam theorem a^2 + b^2 = c^2 to compute the distance between the two points
     
        See https://www.mathsisfun.com/algebra/distance-2-points.html
     */
    public func distanceTo(_ point: CGPoint) -> Double {
        return sqrt(self.horizontalDistanceTo(point).square + self.verticalDistanceTo(point).square)
    }
    
    public func horizontalDistanceTo(_ point: CGPoint) -> Double {
        return Double(point.x - self.x)
    }

    public func verticalDistanceTo(_ point: CGPoint) -> Double {
        return Double(point.y - self.y)
    }
}
