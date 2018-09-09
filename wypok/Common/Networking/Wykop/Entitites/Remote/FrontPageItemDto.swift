//
//  FrontPageItemDto.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 1, 2018

import Foundation
import SwiftyJSON


class FrontPageItemDto : NSObject, NSCoding, RemoteEntity {
    typealias T = FrontPageItemModel
    
    
    var id : Int!
    var title : String!
    var descriptionField : String!
    var tags : String!
    var url : String!
    var sourceUrl : String!
    var voteCount : Int!
    var commentCount : Int!
    var reportCount : Int!
    var relatedCount : Int!
    var date : String!
    var author : String!
    var authorGroup : Int!
    var authorAvatar : String!
    var authorAvatarBig : String!
    var authorAvatarMed : String!
    var authorAvatarLo : String!
    var authorSex : String!
    var type : String!
    var group : String!
    var preview : String!
    var userVote : Bool!
    var userFavorite : Bool!
    var userObserve : Bool!
    var userLists : [AnyObject]!
    var plus18 : Bool!
    var status : String!
    var canVote : Bool!
    var hasOwnContent : Bool!
    var isHot : Bool!
    var category : String!
    var categoryName : String!
    var violationUrl : AnyObject!
    var info : AnyObject!
    var app : AnyObject!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    required init(fromJson json: JSON){
        if json.isEmpty{
            return
        }
        id = json["id"].intValue
        title = json["title"].stringValue
        descriptionField = json["description"].stringValue
        tags = json["tags"].stringValue
        url = json["url"].stringValue
        sourceUrl = json["source_url"].stringValue
        voteCount = json["vote_count"].intValue
        commentCount = json["comment_count"].intValue
        reportCount = json["report_count"].intValue
        relatedCount = json["related_count"].intValue
        date = json["date"].stringValue
        author = json["author"].stringValue
        authorGroup = json["author_group"].intValue
        authorAvatar = json["author_avatar"].stringValue
        authorAvatarBig = json["author_avatar_big"].stringValue
        authorAvatarMed = json["author_avatar_med"].stringValue
        authorAvatarLo = json["author_avatar_lo"].stringValue
        authorSex = json["author_sex"].stringValue
        type = json["type"].stringValue
        group = json["group"].stringValue
        preview = json["preview"].stringValue
        userVote = json["user_vote"].boolValue
        userFavorite = json["user_favorite"].boolValue
        userObserve = json["user_observe"].boolValue
        userLists = [Int]() as [AnyObject]
        //        let userListsArray = json["user_lists"].arrayValue
        //        for userListsJson in userListsArray{
        //            userLists.append(userListsJson.)
        //        }
        plus18 = json["plus18"].boolValue
        status = json["status"].stringValue
        canVote = json["can_vote"].boolValue
        hasOwnContent = json["has_own_content"].boolValue
        isHot = json["is_hot"].boolValue
        category = json["category"].stringValue
        categoryName = json["category_name"].stringValue
        violationUrl = json["violation_url"] as AnyObject
        info = json["info"] as AnyObject
        app = json["app"] as AnyObject
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if title != nil{
            dictionary["title"] = title
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if tags != nil{
            dictionary["tags"] = tags
        }
        if url != nil{
            dictionary["url"] = url
        }
        if sourceUrl != nil{
            dictionary["source_url"] = sourceUrl
        }
        if voteCount != nil{
            dictionary["vote_count"] = voteCount
        }
        if commentCount != nil{
            dictionary["comment_count"] = commentCount
        }
        if reportCount != nil{
            dictionary["report_count"] = reportCount
        }
        if relatedCount != nil{
            dictionary["related_count"] = relatedCount
        }
        if date != nil{
            dictionary["date"] = date
        }
        if author != nil{
            dictionary["author"] = author
        }
        if authorGroup != nil{
            dictionary["author_group"] = authorGroup
        }
        if authorAvatar != nil{
            dictionary["author_avatar"] = authorAvatar
        }
        if authorAvatarBig != nil{
            dictionary["author_avatar_big"] = authorAvatarBig
        }
        if authorAvatarMed != nil{
            dictionary["author_avatar_med"] = authorAvatarMed
        }
        if authorAvatarLo != nil{
            dictionary["author_avatar_lo"] = authorAvatarLo
        }
        if authorSex != nil{
            dictionary["author_sex"] = authorSex
        }
        if type != nil{
            dictionary["type"] = type
        }
        if group != nil{
            dictionary["group"] = group
        }
        if preview != nil{
            dictionary["preview"] = preview
        }
        if userVote != nil{
            dictionary["user_vote"] = userVote
        }
        if userFavorite != nil{
            dictionary["user_favorite"] = userFavorite
        }
        if userObserve != nil{
            dictionary["user_observe"] = userObserve
        }
        if userLists != nil{
            dictionary["user_lists"] = userLists
        }
        if plus18 != nil{
            dictionary["plus18"] = plus18
        }
        if status != nil{
            dictionary["status"] = status
        }
        if canVote != nil{
            dictionary["can_vote"] = canVote
        }
        if hasOwnContent != nil{
            dictionary["has_own_content"] = hasOwnContent
        }
        if isHot != nil{
            dictionary["is_hot"] = isHot
        }
        if category != nil{
            dictionary["category"] = category
        }
        if categoryName != nil{
            dictionary["category_name"] = categoryName
        }
        if violationUrl != nil{
            dictionary["violation_url"] = violationUrl
        }
        if info != nil{
            dictionary["info"] = info
        }
        if app != nil{
            dictionary["app"] = app
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        title = aDecoder.decodeObject(forKey: "title") as? String
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        tags = aDecoder.decodeObject(forKey: "tags") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        sourceUrl = aDecoder.decodeObject(forKey: "source_url") as? String
        voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int
        commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
        reportCount = aDecoder.decodeObject(forKey: "report_count") as? Int
        relatedCount = aDecoder.decodeObject(forKey: "related_count") as? Int
        date = aDecoder.decodeObject(forKey: "date") as? String
        author = aDecoder.decodeObject(forKey: "author") as? String
        authorGroup = aDecoder.decodeObject(forKey: "author_group") as? Int
        authorAvatar = aDecoder.decodeObject(forKey: "author_avatar") as? String
        authorAvatarBig = aDecoder.decodeObject(forKey: "author_avatar_big") as? String
        authorAvatarMed = aDecoder.decodeObject(forKey: "author_avatar_med") as? String
        authorAvatarLo = aDecoder.decodeObject(forKey: "author_avatar_lo") as? String
        authorSex = aDecoder.decodeObject(forKey: "author_sex") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        group = aDecoder.decodeObject(forKey: "group") as? String
        preview = aDecoder.decodeObject(forKey: "preview") as? String
        userVote = aDecoder.decodeObject(forKey: "user_vote") as? Bool
        userFavorite = aDecoder.decodeObject(forKey: "user_favorite") as? Bool
        userObserve = aDecoder.decodeObject(forKey: "user_observe") as? Bool
        userLists = aDecoder.decodeObject(forKey: "user_lists") as? [AnyObject]
        plus18 = aDecoder.decodeObject(forKey: "plus18") as? Bool
        status = aDecoder.decodeObject(forKey: "status") as? String
        canVote = aDecoder.decodeObject(forKey: "can_vote") as? Bool
        hasOwnContent = aDecoder.decodeObject(forKey: "has_own_content") as? Bool
        isHot = aDecoder.decodeObject(forKey: "is_hot") as? Bool
        category = aDecoder.decodeObject(forKey: "category") as? String
        categoryName = aDecoder.decodeObject(forKey: "category_name") as? String
        violationUrl = aDecoder.decodeObject(forKey: "violation_url") as AnyObject
        info = aDecoder.decodeObject(forKey: "info") as AnyObject
        app = aDecoder.decodeObject(forKey: "app") as AnyObject
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if tags != nil{
            aCoder.encode(tags, forKey: "tags")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if sourceUrl != nil{
            aCoder.encode(sourceUrl, forKey: "source_url")
        }
        if voteCount != nil{
            aCoder.encode(voteCount, forKey: "vote_count")
        }
        if commentCount != nil{
            aCoder.encode(commentCount, forKey: "comment_count")
        }
        if reportCount != nil{
            aCoder.encode(reportCount, forKey: "report_count")
        }
        if relatedCount != nil{
            aCoder.encode(relatedCount, forKey: "related_count")
        }
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if authorGroup != nil{
            aCoder.encode(authorGroup, forKey: "author_group")
        }
        if authorAvatar != nil{
            aCoder.encode(authorAvatar, forKey: "author_avatar")
        }
        if authorAvatarBig != nil{
            aCoder.encode(authorAvatarBig, forKey: "author_avatar_big")
        }
        if authorAvatarMed != nil{
            aCoder.encode(authorAvatarMed, forKey: "author_avatar_med")
        }
        if authorAvatarLo != nil{
            aCoder.encode(authorAvatarLo, forKey: "author_avatar_lo")
        }
        if authorSex != nil{
            aCoder.encode(authorSex, forKey: "author_sex")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if group != nil{
            aCoder.encode(group, forKey: "group")
        }
        if preview != nil{
            aCoder.encode(preview, forKey: "preview")
        }
        if userVote != nil{
            aCoder.encode(userVote, forKey: "user_vote")
        }
        if userFavorite != nil{
            aCoder.encode(userFavorite, forKey: "user_favorite")
        }
        if userObserve != nil{
            aCoder.encode(userObserve, forKey: "user_observe")
        }
        if userLists != nil{
            aCoder.encode(userLists, forKey: "user_lists")
        }
        if plus18 != nil{
            aCoder.encode(plus18, forKey: "plus18")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if canVote != nil{
            aCoder.encode(canVote, forKey: "can_vote")
        }
        if hasOwnContent != nil{
            aCoder.encode(hasOwnContent, forKey: "has_own_content")
        }
        if isHot != nil{
            aCoder.encode(isHot, forKey: "is_hot")
        }
        if category != nil{
            aCoder.encode(category, forKey: "category")
        }
        if categoryName != nil{
            aCoder.encode(categoryName, forKey: "category_name")
        }
        if violationUrl != nil{
            aCoder.encode(violationUrl, forKey: "violation_url")
        }
        if info != nil{
            aCoder.encode(info, forKey: "info")
        }
        if app != nil{
            aCoder.encode(app, forKey: "app")
        }
        
    }
    
}
