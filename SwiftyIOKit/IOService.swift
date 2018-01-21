//
//  IOService.swift
//  SwiftyIOKit
//
//  Created by Sergej Jaskiewicz on 22/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

import IOKit

public class IOService: IORegistryEntry {
    
    override class var className: String { return "IOService" }
    
    /// Look up registered IOService objects that match a matching dictionary.
    ///
    /// This is the preferred method of finding `IOService` objects currently
    /// registered by IOKit (that is, objects that have had their
    /// `registerService()` methods invoked). To find `IOService` objects
    /// that aren't yet registered, use an iterator as created
    /// by `IORegistryEntryCreateIterator()`. `IOServiceAddMatchingNotification`
    /// can also supply this information and install a notification of new
    /// `IOService`s. The matching information used in the matching
    /// dictionary may vary depending on the class of service being looked up.
    ///
    /// - Parameter matchingDictionary: A CF dictionary containing matching
    ///   information, of which one reference is always consumed by this
    ///   function (Note prior to the Tiger release there was a small chance
    ///   that the dictionary might not be released if there was an error
    ///   attempting to serialize the dictionary). IOKitLib can construct
    ///   matching dictionaries for common criteria with helper functions
    ///   such as `IOServiceMatching`, `IOServiceNameMatching`,
    ///   `IOBSDNameMatching`.
    /// - Returns: An iterator handle.
    /// - Throws: `IOError` object.
    public static func getMatchingServices(
        matchingDictionary: CFDictionary?
    ) throws -> OSIterator<IOService> {
        
        var iterator = io_iterator_t()
        
        let returnCode = IOServiceGetMatchingServices(kIOMasterPortDefault,
                                                      matchingDictionary,
                                                      &iterator)
        
        return try IOError.throwIfFailed(
            returnCode,
            otherwise: OSObject
                ._createUnsafely(from: iterator,
                                 ofType: OSIterator<IOService>.self)
        )
    }
    
    public static func getMatchingService(
        matchingDictionary: CFDictionary?
    ) -> OSObject? {
        
        let service = IOServiceGetMatchingService(kIOMasterPortDefault,
                                                  matchingDictionary)
        
        return service == 0 ? nil : OSObject._create(from: service)
    }
    
    public static func getMatchingServices<Object: IOService>(
        class: Object.Type
    ) throws -> OSIterator<Object> {
        
        let dict = IOServiceMatching(`class`.className)
        
        var iterator = io_iterator_t()
        
        let returnCode = IOServiceGetMatchingServices(kIOMasterPortDefault,
                                                      dict,
                                                      &iterator)
        
        return try IOError.throwIfFailed(
            returnCode,
            otherwise: OSObject
                ._createUnsafely(from: iterator,
                                 ofType: OSIterator<Object>.self)
        )
    }
    
    public static func getMatchingService<Object: IOService>(
        class: Object.Type
    ) -> Object? {
        
        let dict = IOServiceMatching(`class`.className)
        let service = IOServiceGetMatchingService(kIOMasterPortDefault, dict)
        
        return service == 0 ? nil : OSObject._createSafely(from: service,
                                                           ofType: `class`)
    }
}
