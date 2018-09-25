//
//  FrontPageService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol FrontPageService {
    
    typealias ItemsFetchedClosure = ([FrontPageItemDto]) -> ()
    
    //todo: knows of WypokBaseService
    func getLinksPromoted(and successClosure: @escaping ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure)
    
}
