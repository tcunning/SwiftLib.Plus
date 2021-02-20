//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/11/21.
//
import Foundation

public class BackgroundOperationBase: BackgroundOperationProtocol
{
    private let _backgroundOperation: (() -> ())?
    
    public private(set) var IsStarted: Bool = false;

    public var IsStartedOrWillStart: Bool {
        get {
            DispatchQueue.lock(self) {
                return IsStarted || _restartRequested
            }
        }
    }
    
    public init() {
        _backgroundOperation = nil
    }
    
    public func Start() {
    }
    
    public func Stop() {
    }

    private var _restartRequested: Bool = false;
    
    func BackgroundOperationMain() {
        //fatalError("Background Operation ")
    }
}
