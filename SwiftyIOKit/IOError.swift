//
//  IOError.swift
//  nomouse
//
//  Created by Sergej Jaskiewicz on 21/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

import IOKit

/// An `Error`-conforming wrapper for IO return codes.
///
/// [Making sense of I/O Kit error codes](https://developer.apple.com/library/content/qa/qa1075/_index.html)
///
/// See also the `mach/error.h` header.
public struct IOError: Error, RawRepresentable {
    
    public var rawValue: IOReturn
    
    public init(rawValue: IOReturn) {
        self.rawValue = rawValue
    }
    
    var system: IOReturn {
        get { return (rawValue >> 26) & 0x3f }
        set { rawValue |= (newValue & 0x3f) << 26 }
    }
    
    var subsystem: IOReturn {
        get { return (rawValue >> 14) & 0xfff }
        set { rawValue |= (newValue & 0xfff) << 14 }
    }
    
    var code: IOReturn {
        get { return rawValue & 0x3fff }
        set { rawValue |= newValue & 0x3fff }
    }
    
    static func throwIfFailed<Value>(
        _ returnCode: IOReturn,
        otherwise value: @autoclosure () throws -> Value
    ) throws -> Value {

        if returnCode == kIOReturnSuccess {
            return try value()
        } else {
            throw IOError(rawValue: returnCode)
        }
    }
    
    static func throwIfFailed(_ returnCode: IOReturn) throws {
        if returnCode != kIOReturnSuccess {
            throw IOError(rawValue: returnCode)
        }
    }
}

extension IOError {
    
    init(system: IOReturn, subsystem: IOReturn, code: IOReturn) {
        self.init(rawValue: 0)
        self.system = system
        self.subsystem = subsystem
        self.code = code
    }
}
