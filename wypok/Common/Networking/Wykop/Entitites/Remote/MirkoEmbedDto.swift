//
//  MirkoEmbedDtoRootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 11, 2018

import Foundation
import SwiftyJSON


class MirkoEmbedDto : NSObject, NSCoding{
    
    var type : MirkoEmbedType
    var preview : String!
    var url : String!
    var plus18 : Bool!
    var source : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        type = MirkoEmbedType.map(from: json["type"].string)
        if json.isEmpty{
            return
        }
        preview = json["preview"].stringValue
        url = json["url"].stringValue
        plus18 = json["plus18"].boolValue
        source = json["source"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if type != nil{
            dictionary["type"] = type
        }
        if preview != nil{
            dictionary["preview"] = preview
        }
        if url != nil{
            dictionary["url"] = url
        }
        if plus18 != nil{
            dictionary["plus18"] = plus18
        }
        if source != nil{
            dictionary["source"] = source
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        type = (aDecoder.decodeObject(forKey: "type") as? MirkoEmbedType)!
        preview = aDecoder.decodeObject(forKey: "preview") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        plus18 = aDecoder.decodeObject(forKey: "plus18") as? Bool
        source = aDecoder.decodeObject(forKey: "source") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if preview != nil{
            aCoder.encode(preview, forKey: "preview")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if plus18 != nil{
            aCoder.encode(plus18, forKey: "plus18")
        }
        if source != nil{
            aCoder.encode(source, forKey: "source")
        }
        
    }
    
}
