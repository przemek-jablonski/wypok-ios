//
//  BasePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 25/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class BasePresenter<VS: ViewState>: Presenter {
    
    internal var view: View?
    internal var viewState: VS?
    
    final func attach(_ view: View) {
        self.view = view
        onAttached(view: view)
    }
    
    final func detach(_ view: View) {
        self.view = nil
        onDetached(view: view)
    }
    
    func onAttached(view: View) {
        fatalError()
    }
    
    func onDetached(view: View) {
        fatalError()
    }
    
    func render() {
        assert(viewState != nil, "ERROLOLOLOLOLO")
        render(viewState!)
    }
    
    func render(_ viewState: VS) {
        view?.render(viewState)
    }
    
}
