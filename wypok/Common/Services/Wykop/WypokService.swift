//
//  WypokService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 04/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokService : WypokBaseService, FrontPageService, MirkoService {
    
    func getLinksPromoted(and perform: @escaping FrontPageService.ItemFetchedClosure) {
        performServiceCall(
            urlSuffix: "/links/promoted")
        { dtos in perform(dtos) }
    }
    
    func getMirkoRecents(and perform: @escaping MirkoService.ItemFetchedClosure) {
        performServiceCall(
            urlSuffix: "/stream/index")
        { dtos in perform(dtos) }
    }
    
    func getMirkoHots(and perform: @escaping MirkoService.ItemFetchedClosure) {
        performServiceCall(urlSuffix: "/stream/hot")
        { dtos in perform(dtos) }
    }
    
}


