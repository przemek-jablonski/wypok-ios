//
//  WypokService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 04/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokService : BaseService, FrontPageService {
    
    func getLinksPromoted(response: @escaping ([FrontPageItemDto]) -> ()) {
        performServiceCall(
            urlSuffix: "/links/promoted",
            response: { (dtos: [FrontPageItemDto]) -> () in
                response(dtos)
        })
    }
    
}
