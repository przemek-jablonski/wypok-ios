//
//  FrontPageService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol FrontPageService {
    
    typealias ItemsFetchedClosure = ([FrontPageItemDto]) -> ()
    
    func getLinksPromoted(and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure)
    
}
