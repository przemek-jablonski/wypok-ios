//
//  AuthorModel.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 09/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class UserModel {
    let name: String
    let avatarUrl: String
    let authorRank: AuthorRankModel
    let authorSex: AuthorSexModel
    
    init (name: String, avatarUrl: String, authorRank: AuthorRankModel, authorSex: AuthorSexModel) {
        self.name = name
        self.avatarUrl = avatarUrl
        self.authorRank = authorRank
        self.authorSex = authorSex
    }
}
