//
//  MirkoDetailsInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 09/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol MirkoDetailsInteractor {
    
    typealias ItemFetchedClosure = (MirkoItemModel) -> ()
    typealias FetchingFailureClosure = (MirkoDetailsInteractorError) -> ()
    
    func getMirkoItemDetails(
        for itemId: Int,
        fetchDidSucceed successClosure: @escaping ItemFetchedClosure,
        fetchDidFailed failureClosure: @escaping FetchingFailureClosure)
    
}
