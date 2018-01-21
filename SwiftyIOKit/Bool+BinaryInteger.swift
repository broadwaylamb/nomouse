//
//  Bool+UInt32.swift
//  SwiftyIOKit
//
//  Created by Sergej Jaskiewicz on 22/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

extension Bool {
    
    internal init<T: BinaryInteger>(_ value: T) {
        self = value.distance(to: 0) != 0
    }
}
