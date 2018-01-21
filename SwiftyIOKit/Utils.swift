//
//  Utils.swift
//  SwiftyIOKit
//
//  Created by Sergej Jaskiewicz on 22/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

internal func RequiresConcreteImplementation(_ fn: String = #function,
                                             file: StaticString = #file,
                                             line: UInt = #line) -> Never {
    fatalError("\(fn) must be overriden in subclass implementations",
               file: file,
               line: line)
}
