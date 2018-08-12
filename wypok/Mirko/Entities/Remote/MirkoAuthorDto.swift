//
//  MirkoAuthorDtoRootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 11, 2018

import Foundation
import SwiftyJSON


class MirkoAuthorDto : NSObject, NSCoding{
    
    var author : String!
    var authorGroup : Int!
    var authorAvatar : String!
    var authorAvatarBig : String!
    var authorAvatarMed : String!
    var authorAvatarLo : String!
    var authorSex : String!
    var date : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        author = json["author"].stringValue
        authorGroup = json["author_group"].intValue
        authorAvatar = json["author_avatar"].stringValue
        authorAvatarBig = json["author_avatar_big"].stringValue
        authorAvatarMed = json["author_avatar_med"].stringValue
        authorAvatarLo = json["author_avatar_lo"].stringValue
        authorSex = json["author_sex"].stringValue
        date = json["date"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
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
        if date != nil{
            dictionary["date"] = date
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        author = aDecoder.decodeObject(forKey: "author") as? String
        authorGroup = aDecoder.decodeObject(forKey: "author_group") as? Int
        authorAvatar = aDecoder.decodeObject(forKey: "author_avatar") as? String
        authorAvatarBig = aDecoder.decodeObject(forKey: "author_avatar_big") as? String
        authorAvatarMed = aDecoder.decodeObject(forKey: "author_avatar_med") as? String
        authorAvatarLo = aDecoder.decodeObject(forKey: "author_avatar_lo") as? String
        authorSex = aDecoder.decodeObject(forKey: "author_sex") as? String
        date = aDecoder.decodeObject(forKey: "date") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
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
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        
    }
    
}
