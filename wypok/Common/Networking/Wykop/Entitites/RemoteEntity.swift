//
//  MappableEntity.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import SwiftyJSON

protocol RemoteEntity {

    init(fromJson json: JSON)

}
