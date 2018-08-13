//
//  FrontPageService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol FrontPageService {
    
    typealias ItemFetchedClosure = ([FrontPageItemDto]) -> ()
    
    func getLinksPromoted(and perform: @escaping ItemFetchedClosure)
    
}
