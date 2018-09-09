//
//  AuthorRank.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

enum AuthorRankModel {
    //todo: mapping functions to Interactors
    static func map(from rankInteger: Int) -> AuthorRankModel {
        switch rankInteger {
        case 0: return .green
        case 1: return .orange
        case 2: return .red
        case 5: return .admin
        case 1001: return .inactive
        case 1002: return .inactive
        default : return .unknown
        }
    }
    case green
    case orange
    case red
    case admin
    case inactive //(due to ban, account deletion or else)
    case unknown
}

