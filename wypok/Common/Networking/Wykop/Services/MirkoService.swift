//
//  MirkoService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol MirkoService {
    
    typealias ItemsFetchedClosure = ([MirkoItemDto]) -> ()
    
    func getMirkoRecents(for page: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure)
    
    func getMirkoHots(for page: Int, and period: Int, and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure)
}
