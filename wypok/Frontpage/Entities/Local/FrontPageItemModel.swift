//
//  FrontPageItemModel.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 02/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class FrontPageItemModel {
    let title: String
    let description: String
    let itemUrl: String
    let itemSourceUrl: String
    let previewImageUrl: String
    let upvoteCount: Int
    var commentCount: Int
    let reportsCount: Int
    
    init(title: String, description: String, itemUrl: String, itemSourceUrl: String, previewImageUrl: String,
         upvoteCount: Int, commentCount: Int, reportsCount: Int) {
        self.title = title
        self.description = description
        self.commentCount = commentCount
        self.itemUrl = itemUrl
        self.itemSourceUrl = itemSourceUrl
        self.previewImageUrl = previewImageUrl
        self.upvoteCount = upvoteCount
        self.commentCount = commentCount
        self.reportsCount = reportsCount
    }
}
