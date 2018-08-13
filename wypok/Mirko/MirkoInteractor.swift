//
//  MirkoInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol MirkoInteractor {
    
    typealias ItemsFetchedClosure = ([MirkoItemModel]) -> ()
    
    func getMirkoRecents(and perform: @escaping ItemsFetchedClosure)
    
    func getMirkoHots(and perform: @escaping ItemsFetchedClosure)
    
}
