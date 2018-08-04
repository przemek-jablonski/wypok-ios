//
//  WypokFrontPagePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 24/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokFrontPagePresenter : BasePresenter<WypokFrontPageViewState>, FrontPagePresenter {
    
    private let interactor: FrontPageInteractor = WypokFrontPageInteractor()
    
    override func onAttached(view: View) {
        print("WypokFrontPagePresenter, onAttached: \(view)")
        interactor.getFrontPageItems(with: { models in
            self.onFrontPageItemsFetched(items: models)
        })
    }
    
    private func onFrontPageItemsFetched(items: [FrontPageItemModel]) {
        print("onFrontPageItemsFetched items: \(items)")
        view?.render(WypokFrontPageViewState.ARTICLES_LIST(items))
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
