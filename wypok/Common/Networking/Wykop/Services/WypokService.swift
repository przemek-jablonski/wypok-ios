//
//  WypokService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 04/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import SDWebImage

class WypokService : WypokBaseService, FrontPageService, MirkoService {
    
    func getLinksPromoted(and successClosure: @escaping FrontPageService.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        performServiceCall(for: "/links/promoted", callDidSucceed: successClosure, callDidFailed: failureClosure)
    }
    
    func getMirkoHots(for page: Int, and period: Int, and successClosure: @escaping MirkoService.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        performServiceCall(for: "/stream/hot/page/\(page)/period/\(period)", callDidSucceed: successClosure, callDidFailed: failureClosure)
    }
    
    func getMirkoRecents(for page: Int, and successClosure: @escaping MirkoService.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        performServiceCall(for: "/stream/index/page/\(page)", callDidSucceed: successClosure, callDidFailed: failureClosure)
    }
    
    func getMirkoItemWithComments(for id: Int, and successClosure: @escaping MirkoService.ItemFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        performServiceCall(for: "/entries/index/\(id)", callDidSucceed: successClosure, callDidFailed: failureClosure)
    }
    
}


