//
//  Brightness.swift
//  nomouse
//
//  Created by Sergej Jaskiewicz on 21/01/2018.
//  Copyright © 2018 Sergej Jaskiewicz. All rights reserved.
//

import SwiftyIOKit

struct Brightness {
    
    func setValue(_ value: Float) throws {
        
        let truncated = min(1, max(0, value))
        
        try IOService
            .getMatchingService(class: IODisplayConnect.self)?
            .setFloatParameter(truncated, forKey: .brightness)
    }
    
    func getValue() throws -> Float {
        
        return try IOService
            .getMatchingService(class: IODisplayConnect.self)?
            .getFloatParameter(forKey: .brightness) ?? 0
    }
}
