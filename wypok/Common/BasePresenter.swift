//
//  BasePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 25/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class BasePresenter: Presenter {

    private var view: View? = nil

    func attach(_ view: View) {
        self.view = view
        onAttached(view)
    }
    
    internal func onAttached(_ view: View) {
        fatalError()
    }

    func detach(_ view: View) {
        self.view = nil
        onDetached(view)
    }
    
    internal func onDetached(_ view: View) {
        fatalError()
    }
    
}
