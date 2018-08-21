//
//  MirkoEntity+CoreDataProperties.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 19/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//
//

import Foundation
import CoreData


extension MirkoEntity {

    @nonobjc public class func getFetchRequest() -> NSFetchRequest<MirkoEntity> {
        return NSFetchRequest<MirkoEntity>(entityName: "MirkoEntity")
    }
    

    @NSManaged public var application: String
    @NSManaged public var authorAvatarUrl: String
    @NSManaged public var authorName: String
    @NSManaged public var authorSexMale: Bool
    @NSManaged public var commentCount: Int32
    @NSManaged public var date: NSDate
    @NSManaged public var under18Restriction: Bool
    @NSManaged public var upvoteCount: Int32

}
