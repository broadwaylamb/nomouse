//
//  OSObject.swift
//  SwiftyIOKit
//
//  Created by Sergej Jaskiewicz on 22/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

import IOKit

public class OSObject {
    
    internal private(set) var _object: io_object_t

    public required init() {
        _object = 0
    }
    
    deinit {
        if _object != 0 {
            IOObjectRelease(_object)
        }
    }
    
    var className: String {
        return IOObjectCopyClass(_object).takeRetainedValue() as String
    }
    
    class var className: String { return "OSObject" }
    
    internal static func _create(from object: io_object_t,
                                 retaining: Bool = false) -> OSObject {
        
        if retaining {
            IOObjectRetain(object)
        }
        
        var className = IOObjectCopyClass(object).takeRetainedValue() as String
        
        while true {
            if let result = OSObject._classes[className]?.init() {
                result._object = object
                return result
            } else {
                className =
                    IOObjectCopySuperclassForClass(className as CFString)
                        .takeRetainedValue() as String
            }
        }
    }
    
    internal static func _createUnsafely<T: OSObject>(
        from object: io_object_t,
        ofType type: T.Type,
        retaining: Bool = false
    ) -> T {
        
        if retaining {
            IOObjectRetain(object)
        }
        
        let result = T()
        result._object = object
        return result
    }
    
    internal static func _createSafely<T: OSObject>(
        from object: io_object_t,
        ofType type: T.Type,
        retaining: Bool = false
    ) -> T {
        
        if let result = _create(from: object, retaining: retaining) as? T {
            return result
        } else {
            let actualClass =
                IOObjectCopyClass(object).takeRetainedValue() as String
            fatalError("""
                       The class of object \(object) is \(actualClass), \
                       not \(T.className).
                       """)
        }
    }
    
    private static let _classes: [String : OSObject.Type] = [
        "IODisplayConnect" : IODisplayConnect.self,
        "OSIterator" : OSIterator.self,
        "IORegistryEntry" : IORegistryEntry.self,
        "IOService" : IOService.self,
        "OSObject" : OSObject.self
    ]
}

extension OSObject: Equatable {
    
    /// Checks two object handles to see if they represent the same kernel object.
    ///
    /// If two object handles are returned by IOKitLib functions,
    /// this function will compare them to see if they represent the same
    /// kernel object.
    ///
    /// - Parameters:
    ///   - lhs: An IOKit object
    ///   - rhs: Another IOKit object.
    /// - Returns: If both object handles are valid, and represent the same
    ///            object in the kernel, `true` is returned, otherwise `false`.
    public static func == (lhs: OSObject, rhs: OSObject) -> Bool {
        return Bool(IOObjectIsEqualTo(lhs._object, rhs._object))
    }
}
