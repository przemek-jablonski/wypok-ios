//
//  MirkoItemModel.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class MirkoItemModel {
    
    let authorName: String
    let authorAvatarUrl: String
    let authorSexMale: Bool
    let authorRank: AuthorRank
    
    let application: String?
    let date: Date
    let under18Restriction: Bool
    
//    let userUpvoted: Bool
    let userStarred: Bool
    
    let commentCount: Int
    let upvoteCount: Int
    
    //todo: embed
    //todo: content
    
    init(authorName: String, authorAvatarUrl: String, authorSexMale: Bool, authorRank: AuthorRank, application: String?, date: Date, under18Restriction: Bool, /*userUpvoted: Bool,*/ userStarred: Bool, commentCount: Int, upvoteCount: Int) {
        self.authorName = authorName
        self.authorAvatarUrl = authorAvatarUrl
        self.authorSexMale = authorSexMale
        self.authorRank = authorRank
        self.application = application
        self.date = date
        self.under18Restriction = under18Restriction
//        self.userUpvoted = userUpvoted
        self.userStarred = userStarred
        self.commentCount = commentCount
        self.upvoteCount = upvoteCount
    }
    
}
