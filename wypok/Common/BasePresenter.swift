//
//  BasePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 25/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class BasePresenter<V: View>: Presenter {

    private var view: V? = nil

    func attach(_ view: V) {
        self.view = view
        onAttached(view)
    }
    
    internal func onAttached(_ view: V) {
        fatalError()
    }

    func detach(_ view: V) {
        self.view = nil
        onDetached(view)
    }
    
    internal func onDetached(_ view: V) {
        fatalError()
    }
    
}
