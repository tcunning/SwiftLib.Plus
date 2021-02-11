//
//  DispatchQueue.swift
//  VFSwift
//
//  Created by Tod Cunningham on 7/11/16.
//  Copyright © 2016 Vectorform. All rights reserved.
//
import Foundation

public extension DispatchQueue {    
    /**
     Implements the functionality that was available though @synchronized.
     
     See  https://stackoverflow.com/questions/24045895/what-is-the-swift-equivalent-to-objective-cs-synchronized/32923617
     
     - parameter token: Any instance such as a unique reverse DNS style string such as "com.vectorform.<name>" or a GUID
     - parameter block: Block to execute once (default is @noescape means the closure won't get called outside the context of this method.)
     */
    class func lock(_ lock: Any, block: () -> () ) {
        objc_sync_enter(self);
        defer { objc_sync_exit(self) }
        block()
    }
    
    class func lock(_ lock: Any, block: () throws -> () ) rethrows {
        objc_sync_enter(self);
        defer { objc_sync_exit(self) }
        try block()
    }
    
    class func lock<TValue>(_ lock: Any, _ block: () throws -> TValue) rethrows -> TValue {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        return try block()
    }
}
