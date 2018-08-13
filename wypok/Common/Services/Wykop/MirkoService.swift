//
//  MirkoService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol MirkoService {
    
    typealias ItemFetchedClosure = ([MirkoItemDto]) -> ()
    
    func getMirkoRecents(and perform: @escaping ItemFetchedClosure)
    
    func getMirkoHots(and perform: @escaping ItemFetchedClosure)
    
}
