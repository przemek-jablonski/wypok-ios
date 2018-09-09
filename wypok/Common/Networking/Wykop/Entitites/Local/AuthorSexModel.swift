//
//  AuthorSex.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 09/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

enum AuthorSexModel {
    
    static func map(from sexString: String) -> AuthorSexModel {
        switch sexString {
        case "male": return .male
        case "female": return .female
        default: return .undefined
        }
    }
    
    case male
    case female
    case undefined
}
