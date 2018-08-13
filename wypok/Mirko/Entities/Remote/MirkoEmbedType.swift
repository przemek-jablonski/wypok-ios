//
//  MirkoEmbedType.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

//todo: application should be as enum as well (i guess)
enum MirkoEmbedType {
    static func map(from string: String?) -> MirkoEmbedType {
        switch(string) {
        case "image": return .IMAGE
        case "video": return .VIDEO
        default: return .UNDEFINED
        }
    }
    case IMAGE
    case VIDEO
    case UNDEFINED
}
