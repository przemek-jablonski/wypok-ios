//
//  MirkoItemDtoRootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 11, 2018

import Foundation
import SwiftyJSON


class MirkoItemDto : NSObject, NSCoding, RemoteEntity {
    typealias T = MirkoItemModel
    
    
    var id : Int!
    var author : String!
    var authorAvatar : String!
    var authorAvatarBig : String!
    var authorAvatarMed : String!
    var authorAvatarLo : String!
    var authorGroup : Int!
    var authorSex : String!
    var date : String!
    var body : String!
    var source : String?
    var url : String!
    var receiver : String?
    var receiverAvatar : String?
    var receiverAvatarBig : String?
    var receiverAvatarMed : String?
    var receiverAvatarLo : String?
    var receiverGroup : Int?
    var comments : [MirkoCommentDto]!
    var blocked : Bool!
    var voteCount : Int!
    var userVote : Int!
    var userFavorite : Bool!
    var voters : [MirkoAuthorDto]!
    var type : String!
    var embed : MirkoEmbedDto?
    var deleted : Bool!
    var violationUrl : String?
    var canComment : Bool?
    var app : String?
    var commentCount : Int!
    
    func mapToLocal() -> MirkoItemModel {
        let embedModel: EmbedModel?
        //todo: why UNDEFINED and NIL-storing object is not null?
        if (embed != nil && embed!.type != MirkoEmbedType.UNDEFINED) {
            embedModel = EmbedModel(contentType: getEmbedTypeModel(embed!.type), previewImageUrl: embed!.preview, contentUrl: embed!.url, under18RestrictedFlag: embed!.plus18)
        } else {
            embedModel = nil
        }
        
        return MirkoItemModel(id: id, content: body, embed: embedModel, authorName: author, authorAvatarUrl: authorAvatarBig, authorSexMale: authorSex == "male", authorRank: AuthorRankModel.map(from: authorGroup), application: app, date: Date(), under18Restriction: embed?.plus18 ?? false, commentCount: commentCount, upvoteCount: voteCount)
    }
    
    private func getEmbedTypeModel(_ embedType: MirkoEmbedType) -> EmbedTypeModel {
        switch(embedType) {
        case .IMAGE:
            return EmbedTypeModel.IMAGE
        case .VIDEO:
            return EmbedTypeModel.VIDEO
        case .UNDEFINED:
            return EmbedTypeModel.UNDEFINED
        }
    }
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    required init(fromJson json: JSON){
        if json.isEmpty{
            return
        }
        id = json["id"].intValue
        author = json["author"].stringValue
        authorAvatar = json["author_avatar"].stringValue
        authorAvatarBig = json["author_avatar_big"].stringValue
        authorAvatarMed = json["author_avatar_med"].stringValue
        authorAvatarLo = json["author_avatar_lo"].stringValue
        authorGroup = json["author_group"].intValue
        authorSex = json["author_sex"].stringValue
        date = json["date"].stringValue
        body = json["body"].stringValue
        source = json["source"].string
        url = json["url"].stringValue
        receiver = json["receiver"].string
        receiverAvatar = json["receiver_avatar"].string
        receiverAvatarBig = json["receiver_avatar_big"].string
        receiverAvatarMed = json["receiver_avatar_med"].string
        receiverAvatarLo = json["receiver_avatar_lo"].string
        receiverGroup = json["receiver_group"].int
        comments = [MirkoCommentDto]()
        for commentJson in json["comments"].arrayValue {
            comments.append(MirkoCommentDto(fromJson: commentJson))
        }
        blocked = json["blocked"].boolValue
        voteCount = json["vote_count"].intValue
        userVote = json["user_vote"].intValue
        userFavorite = json["user_favorite"].boolValue
        voters = [MirkoAuthorDto]()
        for voterJson in json["voters"].arrayValue {
            voters.append(MirkoAuthorDto(fromJson: voterJson))
        }
        type = json["type"].stringValue
        embed = MirkoEmbedDto(fromJson: json["embed"])
        deleted = json["deleted"].boolValue
        violationUrl = json["violation_url"].string
        canComment = json["can_comment"].bool
        app = json["app"].stringValue
        commentCount = json["comment_count"].intValue
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
        if author != nil{
            dictionary["author"] = author
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
        if authorGroup != nil{
            dictionary["author_group"] = authorGroup
        }
        if authorSex != nil{
            dictionary["author_sex"] = authorSex
        }
        if date != nil{
            dictionary["date"] = date
        }
        if body != nil{
            dictionary["body"] = body
        }
        if source != nil{
            dictionary["source"] = source
        }
        if url != nil{
            dictionary["url"] = url
        }
        if receiver != nil{
            dictionary["receiver"] = receiver
        }
        if receiverAvatar != nil{
            dictionary["receiver_avatar"] = receiverAvatar
        }
        if receiverAvatarBig != nil{
            dictionary["receiver_avatar_big"] = receiverAvatarBig
        }
        if receiverAvatarMed != nil{
            dictionary["receiver_avatar_med"] = receiverAvatarMed
        }
        if receiverAvatarLo != nil{
            dictionary["receiver_avatar_lo"] = receiverAvatarLo
        }
        if receiverGroup != nil{
            dictionary["receiver_group"] = receiverGroup
        }
        if comments != nil{
            var dictionaryElements = [[String:Any]]()
            for commentsElement in comments {
                dictionaryElements.append(commentsElement.toDictionary())
            }
            dictionary["comments"] = dictionaryElements
        }
        if blocked != nil{
            dictionary["blocked"] = blocked
        }
        if voteCount != nil{
            dictionary["vote_count"] = voteCount
        }
        if userVote != nil{
            dictionary["user_vote"] = userVote
        }
        if userFavorite != nil{
            dictionary["user_favorite"] = userFavorite
        }
        if voters != nil{
            dictionary["voters"] = voters
        }
        if type != nil{
            dictionary["type"] = type
        }
        if embed != nil{
            dictionary["embed"] = embed
        }
        if deleted != nil{
            dictionary["deleted"] = deleted
        }
        if violationUrl != nil{
            dictionary["violation_url"] = violationUrl
        }
        if canComment != nil{
            dictionary["can_comment"] = canComment
        }
        if app != nil{
            dictionary["app"] = app
        }
        if commentCount != nil{
            dictionary["comment_count"] = commentCount
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
        author = aDecoder.decodeObject(forKey: "author") as? String
        authorAvatar = aDecoder.decodeObject(forKey: "author_avatar") as? String
        authorAvatarBig = aDecoder.decodeObject(forKey: "author_avatar_big") as? String
        authorAvatarMed = aDecoder.decodeObject(forKey: "author_avatar_med") as? String
        authorAvatarLo = aDecoder.decodeObject(forKey: "author_avatar_lo") as? String
        authorGroup = aDecoder.decodeObject(forKey: "author_group") as? Int
        authorSex = aDecoder.decodeObject(forKey: "author_sex") as? String
        date = aDecoder.decodeObject(forKey: "date") as? String
        body = aDecoder.decodeObject(forKey: "body") as? String
        source = aDecoder.decodeObject(forKey: "source") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        receiver = aDecoder.decodeObject(forKey: "receiver") as? String
        receiverAvatar = aDecoder.decodeObject(forKey: "receiver_avatar") as? String
        receiverAvatarBig = aDecoder.decodeObject(forKey: "receiver_avatar_big") as? String
        receiverAvatarMed = aDecoder.decodeObject(forKey: "receiver_avatar_med") as? String
        receiverAvatarLo = aDecoder.decodeObject(forKey: "receiver_avatar_lo") as? String
        receiverGroup = aDecoder.decodeObject(forKey: "receiver_group") as? Int
        comments = aDecoder.decodeObject(forKey: "comments") as? [MirkoCommentDto]
        blocked = aDecoder.decodeObject(forKey: "blocked") as? Bool
        voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int
        userVote = aDecoder.decodeObject(forKey: "user_vote") as? Int
        userFavorite = aDecoder.decodeObject(forKey: "user_favorite") as? Bool
        voters = aDecoder.decodeObject(forKey: "voters") as? [MirkoAuthorDto]
        type = aDecoder.decodeObject(forKey: "type") as? String
        embed = (aDecoder.decodeObject(forKey: "embed") as? MirkoEmbedDto)!
        deleted = aDecoder.decodeObject(forKey: "deleted") as? Bool
        violationUrl = aDecoder.decodeObject(forKey: "violation_url") as? String
        canComment = aDecoder.decodeObject(forKey: "can_comment") as? Bool
        app = (aDecoder.decodeObject(forKey: "app") as? String)!
        commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
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
        if author != nil{
            aCoder.encode(author, forKey: "author")
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
        if authorGroup != nil{
            aCoder.encode(authorGroup, forKey: "author_group")
        }
        if authorSex != nil{
            aCoder.encode(authorSex, forKey: "author_sex")
        }
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if body != nil{
            aCoder.encode(body, forKey: "body")
        }
        if source != nil{
            aCoder.encode(source, forKey: "source")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if receiver != nil{
            aCoder.encode(receiver, forKey: "receiver")
        }
        if receiverAvatar != nil{
            aCoder.encode(receiverAvatar, forKey: "receiver_avatar")
        }
        if receiverAvatarBig != nil{
            aCoder.encode(receiverAvatarBig, forKey: "receiver_avatar_big")
        }
        if receiverAvatarMed != nil{
            aCoder.encode(receiverAvatarMed, forKey: "receiver_avatar_med")
        }
        if receiverAvatarLo != nil{
            aCoder.encode(receiverAvatarLo, forKey: "receiver_avatar_lo")
        }
        if receiverGroup != nil{
            aCoder.encode(receiverGroup, forKey: "receiver_group")
        }
        if comments != nil{
            aCoder.encode(comments, forKey: "comments")
        }
        if blocked != nil{
            aCoder.encode(blocked, forKey: "blocked")
        }
        if voteCount != nil{
            aCoder.encode(voteCount, forKey: "vote_count")
        }
        if userVote != nil{
            aCoder.encode(userVote, forKey: "user_vote")
        }
        if userFavorite != nil{
            aCoder.encode(userFavorite, forKey: "user_favorite")
        }
        if voters != nil{
            aCoder.encode(voters, forKey: "voters")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if embed != nil{
            aCoder.encode(embed, forKey: "embed")
        }
        if deleted != nil{
            aCoder.encode(deleted, forKey: "deleted")
        }
        if violationUrl != nil{
            aCoder.encode(violationUrl, forKey: "violation_url")
        }
        if canComment != nil{
            aCoder.encode(canComment, forKey: "can_comment")
        }
        if app != nil{
            aCoder.encode(app, forKey: "app")
        }
        if commentCount != nil{
            aCoder.encode(commentCount, forKey: "comment_count")
        }
        
    }
    
}
