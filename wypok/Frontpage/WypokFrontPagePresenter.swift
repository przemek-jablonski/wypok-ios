//
//  WypokFrontPagePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 24/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokFrontPagePresenter<V : FrontPageView> {
    
    private var view: V?
    
    func attach(_ view: V) {
        print("attach, view: \(view)")
        self.view = view
    }
    
    func detach(_ view: V) {
        print("detach, view: \(view)")
        self.view = nil
    }
    
}
