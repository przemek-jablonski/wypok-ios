//
//  WypokMirkoDetailsInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 09/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokMirkoDetailsInteractor: MirkoDetailsInteractor {
    
    private let service: MirkoService
    
    init(service: MirkoService) {
        self.service = service
    }
    
    func getMirkoItemDetails(for itemId: Int, fetchDidSucceed successClosure: @escaping MirkoDetailsInteractor.ItemFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        service.getMirkoItemWithComments(for: itemId, and: { dto in
            successClosure(dto.map())
        }, fetchDidFailed: { error in
            failureClosure(error)
        })
    }
    
}
