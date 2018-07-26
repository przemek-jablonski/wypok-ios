//
//  Presenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 26/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

protocol Presenter {
    
    associatedtype V
    
    func attach(_ view: V)
    
    func detach(_ view: V)
    
}
