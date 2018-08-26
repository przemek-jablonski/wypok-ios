//
//  MirkoItemModel.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class MirkoItemModel {
    
    let content: String
    let embed: EmbedModel?
    let authorName: String
    let authorAvatarUrl: String
    let authorSexMale: Bool
    let authorRank: AuthorRank
    let application: String?
    let date: Date
    let commentCount: Int
    let upvoteCount: Int
    
    init(content: String, embed: EmbedModel?, authorName: String, authorAvatarUrl: String, authorSexMale: Bool, authorRank: AuthorRank, application: String?, date: Date, under18Restriction: Bool, commentCount: Int, upvoteCount: Int) {
        self.content = content
        self.embed = embed
        self.authorName = authorName
        self.authorAvatarUrl = authorAvatarUrl
        self.authorSexMale = authorSexMale
        self.authorRank = authorRank
        self.application = application
        self.date = date
        self.commentCount = commentCount
        self.upvoteCount = upvoteCount
    }
}
