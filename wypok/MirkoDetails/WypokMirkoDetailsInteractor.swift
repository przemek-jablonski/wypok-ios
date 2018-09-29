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
    
    func getMirkoItemDetails(
        for itemId: Int,
        fetchDidSucceed successClosure: @escaping ItemFetchedClosure,
        fetchDidFailed failureClosure: @escaping FetchingFailureClosure) {
        service.getMirkoItemWithComments(for: itemId, and: { dto in
            successClosure(dto.map())
        }, fetchDidFailed: { error in
            failureClosure(error.map())
        })
    }    
}


fileprivate extension WykopServiceError {
    func map() -> MirkoDetailsInteractorError {
        switch self {
        case .apiError(let errorCode, let message):
            return MirkoDetailsInteractorError.apiError(errorCode, message)
        case .generalError(let error):
            return MirkoDetailsInteractorError.undefinedApiError(error)
        }
    }
}
