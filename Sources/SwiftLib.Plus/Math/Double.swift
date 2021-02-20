//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/19/21.
//
import Foundation

extension Double {
    
    public var square : Double {
        get {
            return pow(self, 2)
        }
    }
    
    public func isAlmostEqual(_ valueB: Double) -> Bool {
        return almostEqual(self, valueB)
    }

    public var split: (whole: Int, fraction: Double) {
        get {
            let whole = Int(self)
            let fractional = self.truncatingRemainder(dividingBy: 1);
            return (whole, fractional)
        }
    }

    public func split(decimalPlaces: Int) -> (whole: Int, fraction: Double) {
        let whole = Int(self)
        let fractional = self.truncatingRemainder(dividingBy: 1);
        return (whole, fractional.truncateTo(decimalPlaces: decimalPlaces))
    }
    
    public func truncateTo( decimalPlaces: Int ) -> Double {
        let maxDecimalPlaces = 15

        if decimalPlaces <= 0 {
            return Double(Int(self))
        }
        
        if decimalPlaces > maxDecimalPlaces {
            return self;
        }
        
        let splitValue = self.split
        let factor = pow(10.0, Double(decimalPlaces))
        let truncatedFractionalInt = Int(splitValue.fraction * factor)
        return Double(splitValue.whole) + (Double(truncatedFractionalInt) / factor)
    }

    //public func isAlmostEqual(_ valueB: double, decimalPlaces: int ) -> bool {
    //    TODO
    //    return false;
    //}
    
}
