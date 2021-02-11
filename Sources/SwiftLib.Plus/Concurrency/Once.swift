//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/10/21.
//
import Foundation

public extension DispatchQueue {
    private static var _onceTracker = [String]()

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
