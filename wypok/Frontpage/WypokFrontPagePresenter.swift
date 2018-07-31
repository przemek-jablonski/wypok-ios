//
//  WypokFrontPagePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 24/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokFrontPagePresenter : BasePresenter<WypokFrontPageViewState>, FrontPagePresenter {
    
    
    override func onAttached(view: View) {
        print("WypokFrontPagePresenter, onAttached: \(view)")
        self.view?.render(WypokFrontPageViewState.ARTICLES_LIST)
    }
    
    override func onDetached(view: View) {
        print("WypokFrontPagePresenter, onDetached: \(view)")
    }
    
    func onFrontPageItemClicked() {
    }
    
    func onFrontPageItemForceTouchedClicked() {
        
    }
    
    func onFrontPageItemSwipedLeft() {
        
    }
    
    func onFrontPageItemSwipedRight() {
        
    }
    
}
