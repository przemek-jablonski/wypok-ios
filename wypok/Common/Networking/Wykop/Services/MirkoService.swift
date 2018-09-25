//
//  MirkoService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol MirkoService {
    
    typealias ItemFetchedClosure = (MirkoItemDto) -> ()
    typealias ItemsFetchedClosure = ([MirkoItemDto]) -> ()
    
    //todo: this protocol knows about WypokBaseService!
    func getMirkoRecents(for page: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)
    
    func getMirkoHots(for page: Int, and period: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)
    
    func getMirkoItemWithComments(for id: Int, and successClosure: @escaping ItemFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)
    
}
