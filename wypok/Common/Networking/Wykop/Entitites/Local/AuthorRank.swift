//
//  AuthorRank.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

enum AuthorRank {
    //todo: mapping functions to Interactors
    static func map(from int: Int) -> AuthorRank {
        switch(int) {
        case 0: return .GREEN
        case 1: return .ORANGE
        case 2: return .RED
        case 5: return .ADMIN
        case 1001: return .INACTIVE
        case 1002: return .INACTIVE
        default : return .UNKNOWN
        }
    }
    case GREEN
    case ORANGE
    case RED
    case ADMIN
    case INACTIVE //(due to ban, account deletion or else)
    case UNKNOWN
}

