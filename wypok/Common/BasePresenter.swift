//
//  WypokBasePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 24/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

protocol BasePresenter {
    associatedtype V: inout View
    
    var view: V? { get } //this feels wrong lol
    
    func attach(_ view: V)
    
    func detach(_ view: V)
    
}
