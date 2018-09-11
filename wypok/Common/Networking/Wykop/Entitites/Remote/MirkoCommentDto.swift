//
//  MirkoItemDtoComment.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 11, 2018

import Foundation
import SwiftyJSON


class MirkoCommentDto : NSObject, NSCoding{
    
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
    var entryId : Int!
    var blocked : Bool!
    var deleted : Bool!
    var voteCount : Int!
    var userVote : Int!
    var voters : [MirkoAuthorDto]!
    var embed : EmbedDto?
    var type : String!
    var app : String?
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
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
        entryId = json["entry_id"].intValue
        blocked = json["blocked"].boolValue
        deleted = json["deleted"].boolValue
        voteCount = json["vote_count"].intValue
        userVote = json["user_vote"].intValue
        voters = [MirkoAuthorDto]()
        for voterJson in json["voters"].arrayValue {
            voters.append(MirkoAuthorDto(fromJson: voterJson))
        }
        embed = EmbedDto(fromJson: json["embed"])
        type = json["type"].stringValue
        app = json["app"].string
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
        if entryId != nil{
            dictionary["entry_id"] = entryId
        }
        if blocked != nil{
            dictionary["blocked"] = blocked
        }
        if deleted != nil{
            dictionary["deleted"] = deleted
        }
        if voteCount != nil{
            dictionary["vote_count"] = voteCount
        }
        if userVote != nil{
            dictionary["user_vote"] = userVote
        }
        if voters != nil{
            dictionary["voters"] = voters
        }
        if embed != nil{
            dictionary["embed"] = embed
        }
        if type != nil{
            dictionary["type"] = type
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
        entryId = aDecoder.decodeObject(forKey: "entry_id") as? Int
        blocked = aDecoder.decodeObject(forKey: "blocked") as? Bool
        deleted = aDecoder.decodeObject(forKey: "deleted") as? Bool
        voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int
        userVote = aDecoder.decodeObject(forKey: "user_vote") as? Int
        voters = aDecoder.decodeObject(forKey: "voters") as? [MirkoAuthorDto]
        embed = aDecoder.decodeObject(forKey: "embed") as? EmbedDto
        type = aDecoder.decodeObject(forKey: "type") as? String
        app = aDecoder.decodeObject(forKey: "app") as? String
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
        if entryId != nil{
            aCoder.encode(entryId, forKey: "entry_id")
        }
        if blocked != nil{
            aCoder.encode(blocked, forKey: "blocked")
        }
        if deleted != nil{
            aCoder.encode(deleted, forKey: "deleted")
        }
        if voteCount != nil{
            aCoder.encode(voteCount, forKey: "vote_count")
        }
        if userVote != nil{
            aCoder.encode(userVote, forKey: "user_vote")
        }
        if voters != nil{
            aCoder.encode(voters, forKey: "voters")
        }
        if embed != nil{
            aCoder.encode(embed, forKey: "embed")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if app != nil{
            aCoder.encode(app, forKey: "app")
        }
        
    }
    
}
