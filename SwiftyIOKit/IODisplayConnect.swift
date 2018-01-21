//
//  IODisplayConnect.swift
//  SwiftyIOKit
//
//  Created by Sergej Jaskiewicz on 22/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

import IOKit

public final class IODisplayConnect: IOService {
    
    override class var className: String { return "IODisplayConnect" }
    
    public func setFloatParameter(_ value: Float,
                                  forKey key: IOParameterKey) throws {

        try IOError
            .throwIfFailed(IODisplaySetFloatParameter(_object,
                                                      0,
                                                      key._rawValue as CFString,
                                                      value))
    }
    
    public func getFloatParameter(forKey key: IOParameterKey) throws -> Float {
        
        var value: Float = 0
        let returnCode = IODisplayGetFloatParameter(_object,
                                                    0,
                                                    key._rawValue as CFString,
                                                    &value)
        
        return try IOError.throwIfFailed(returnCode, otherwise: value)
    }
}
