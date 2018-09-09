//
//  MirkoCommentModel.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 09/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class MirkoCommentModel {
    
    let id: Int
    let author: UserModel
    let date: Date
    let body: String
    let parentEntryId: Int
    let upvoteCount: Int
    let embed: EmbedModel?
    
    init(id: Int, author: UserModel, date: Date, body: String, parentEntryId: Int, upvoteCount: Int, embed: EmbedModel?) {
        self.id = id
        self.author = author
        self.date = date
        self.body = body
        self.parentEntryId = parentEntryId
        self.upvoteCount = upvoteCount
        self.embed = embed
    }
    
}
