//
//  MirkoItemModel.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

//todo: models should not e in /Networking group anyways
class MirkoItemModel: NSObject {
    
    let id: Int
    let content: String
    let embed: EmbedModel?
    let authorName: String
    let authorAvatarUrl: String
    let authorSexMale: Bool
    let authorRank: AuthorRankModel
    let application: String?
    let date: Date
    let commentCount: Int
    let upvoteCount: Int
    let comments: [MirkoCommentModel]?
    
    init(id: Int, content: String, embed: EmbedModel?, authorName: String, authorAvatarUrl: String, authorSexMale: Bool, authorRank: AuthorRankModel, application: String?, date: Date, under18Restriction: Bool, commentCount: Int, upvoteCount: Int, comments: [MirkoCommentModel]?) {
        self.id = id
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
        self.comments = comments
    }
}
