//
//  Random.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 23/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
class Random {
    
    enum StringRandomType {
        case UUID
    }
    
    
    static func string(by type: StringRandomType) -> String {
        switch type {
        case .UUID:
            return UUID().uuidString.replacingOccurrences(of: "-", with: "")
        }
    }
    
    static func int() -> Int {
        return intMaxRange()
    }
    
    static func intMaxRange() -> Int {
        return Int.random(in: Int.min ..< Int.max)
    }
    
    static func intWithCurrentTimestamp() -> Int {
        return Int.random(in: 0 ..< Int(Date().timeIntervalSince1970))
    }

    static func bool() -> Bool {
        return Bool.random()
    }
    
    static func date() -> Date {
        return Date.init(timeIntervalSince1970: TimeInterval(intWithCurrentTimestamp()))
    }
    
}
