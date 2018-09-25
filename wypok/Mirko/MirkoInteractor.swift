//
//  MirkoInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol MirkoInteractor {
    
    typealias ItemsFetchedClosure = ([MirkoItemModel]) -> ()
    
    func getMirkoRecents(and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)
    
    func getMirkoHots(and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)
    
}
