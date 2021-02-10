//
//  DispatchQueue.swift
//  VFSwift
//
//  Created by Tod Cunningham on 7/11/16.
//  Copyright © 2016 Vectorform. All rights reserved.
//
import Foundation

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Implements the functionality that was available though @synchronized.
     
     See  https://stackoverflow.com/questions/24045895/what-is-the-swift-equivalent-to-objective-cs-synchronized/32923617
     
     - parameter token: Any instance such as a unique reverse DNS style string such as "com.vectorform.<name>" or a GUID
     - parameter block: Block to execute once (default is @noescape means the closure won't get called outside the context of this method.)
     */
    class func lock(_ lock: Any, block: ()->() ) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        block()
    }
    
    class func synchronized<T>(_ lock: Any, _ block: () throws -> T) rethrows -> T {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        return try block()
    }
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
    
     Examples:
        DispatchQueue.once(token: "com.todcunningham.test") {
            print( "Do This Once!" )
        }
     
        OR
     
        private let _onceToken = NSUUID().uuidString

        DispatchQueue.once(token: _onceToken) {
            print( "Do This Once!" )
        }
     
     - parameter token: Any instance such as a unique reverse DNS style string such as "com.vectorform.<name>" or a GUID
     - parameter block: Block to execute once (@noescape means the closure won't get called outside the context of this method.)
     */
    class func once(token: String, block: () -> () ) {
        lock(token) {
            guard !_onceTracker.contains(token) else { return }
            _onceTracker.append(token)
        }
    }


    
}
