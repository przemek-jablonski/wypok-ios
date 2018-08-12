//
//  WypokService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 04/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokService : WypokBaseService, FrontPageService, MirkoService {
    
    func getLinksPromoted(response: @escaping ([FrontPageItemDto]) -> ()) {
        performServiceCall(
            urlSuffix: "/links/promoted")
        { dtos in
            response(dtos)
        }
    }
    
    func getMirkoRecents(response: @escaping ([MirkoItemDto]) -> ()) {
        performServiceCall(
            urlSuffix: "/stream/index")
        { dtos in
            response(dtos)
        }
    }
    
    func getMirkoHots(response: @escaping ([MirkoItemDto]) -> ()) {
        performServiceCall(urlSuffix: "/stream/hot")
        { dtos in
            response(dtos)
        }
    }
    
}


