//
//  Presenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 26/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

protocol Presenter {
    
    func attach(_ view: View)
    
    func detach(_ view: View)
    
}
