//
//  OSIterator.swift
//  SwiftyIOKit
//
//  Created by Sergej Jaskiewicz on 22/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

import IOKit

public class OSIterator<Object: OSObject>: OSObject, IteratorProtocol {
    
    override class var className: String { return "OSIterator" }

    public func next() -> Object? {
        
        let object = IOIteratorNext(_object)
        
        if object == 0 {
            return nil
        } else {
            return OSObject._createSafely(from: object, ofType: Object.self)
        }
    }
    
    public func reset() {
        IOIteratorReset(_object)
    }
    
    public var isValid: Bool {
        return Bool(IOIteratorIsValid(_object))
    }
}
