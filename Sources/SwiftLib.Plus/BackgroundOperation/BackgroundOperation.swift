//
//  File.swift
//  
//
//  Created by Tod Cunningham on 2/11/21.
//

import Foundation

public class BackgroundOperation: BackgroundOperationProtocol
{
    private let _backgroundOperation: (() -> ())?
    
    public init() {
        _backgroundOperation = nil
    }
    
    public func Start() {
    }
    
    public func Stop() {
    }
    
}
