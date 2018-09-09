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
    
    func getMirkoItemWithComments(fetchDidSucceed successClosure: @escaping MirkoDetailsInteractor.ItemFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        service.getMirkoItemWithComments(for: 123123, and: { dto in
//            successClosure(dto)
        }, fetchDidFailed: { error in
            failureClosure(error)
        })
    }
    
}
