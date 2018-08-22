//
//  WypokService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 04/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokService : WypokBaseService, FrontPageService, MirkoService {
    func getLinksPromoted(and successClosure: @escaping FrontPageService.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        performServiceCall(for: "/links/promoted", callDidSucceed: successClosure, callDidFailed: failureClosure)
    }
    
    func getMirkoRecents(and successClosure: @escaping MirkoService.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        performServiceCall(for: "/stream/index", callDidSucceed: successClosure, callDidFailed: failureClosure)
    }
    
    func getMirkoHots(and successClosure: @escaping MirkoService.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        performServiceCall(for: "/stream/hot", callDidSucceed: successClosure, callDidFailed: failureClosure)
    }
    
    
    override init () {
        super.init()
    }
    
//    func getLinksPromoted(and perform: @escaping FrontPageService.ItemsFetchedClosure) {
//
//        performServiceCall(urlSuffix: "/links/promoted"){ dtos in perform(dtos) }
//    }
//
//    func getMirkoRecents(and perform: @escaping MirkoService.ItemsFetchedClosure) {
//        performServiceCall(
//            urlSuffix: "/stream/index")
//        { dtos in perform(dtos) }
//    }
//
//    func getMirkoHots(and perform: @escaping MirkoService.ItemsFetchedClosure) {
//        performServiceCall(urlSuffix: "/stream/hot")
//        { dtos in perform(dtos) }
//    }
    
}


