//
//  FrontPageItemModel.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 02/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class FrontPageItemModel: NSObject {
    let id: NSInteger
    let title: String
    let desc: String
    let itemUrl: String
    let itemSourceUrl: String
    let previewImageUrl: String
    let upvoteCount: Int
    var commentCount: Int
    let reportsCount: Int
    
    var isVisited = false //should be here
    var isHidden = false //todo: this should be in coredata
    var isUpvoted = false //todo: this is in the wykop api (should be probably in coredata)
    var isDownvoted = false //todo: this is in the wykop api (should be probably in coredata)
    
    init(id: Int, title: String, description: String, itemUrl: String, itemSourceUrl: String, previewImageUrl: String,
         upvoteCount: Int, commentCount: Int, reportsCount: Int) {
        self.id = id
        self.title = title
        self.desc = description
        self.commentCount = commentCount
        self.itemUrl = itemUrl
        self.itemSourceUrl = itemSourceUrl
        self.previewImageUrl = previewImageUrl
        self.upvoteCount = upvoteCount
        self.commentCount = commentCount
        self.reportsCount = reportsCount
    }
    
    override var hash: Int {
        return self.id
    }
    
//    override func isEqual(_ object: Any?) -> Bool {
//        return super.isEqual(object)
////        if (object == nil) {
////            return false
////        }
////        if (self.isKind(of: type(of: object))) {
////
////        }
//    }
    
}
