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
    private var frontPageItems: [FrontPageItemModel] = [FrontPageItemModel]()
    
    override func onAttached(view: View) {
        print("WypokFrontPagePresenter, onAttached: \(view)")
        interactor.getFrontPageItems(with: { models in
            self.onFrontPageItemsFetched(items: models)
        })
    }
    
    private func onFrontPageItemsFetched(items: [FrontPageItemModel]) {
        frontPageItems = items
        view?.render(WypokFrontPageViewState.ARTICLES_LIST(frontPageItems))
    }
    
    override func onDetached(view: View) {
        print("WypokFrontPagePresenter, onDetached: \(view)")
    }
    
    func onFrontPageItemClicked(row: Int) {
    }
    
    func onFrontPageItemForceTouchedClicked(row: Int) {
        
    }
    
    func onFrontPageItemActionCalled(row: Int, action: FrontPageItemAction) {
        print("onFrontPageItemActionCalled, row: \(row), action: \(action)")
        let frontPageItem = frontPageItems[row].resetUserPreferences()
        switch action {
        case .UPVOTE:
            frontPageItem.isUpvoted = true
        case .DOWNVOTE:
            frontPageItem.isDownvoted = true
        case .HIDE:
            frontPageItem.isHidden = true
        }
        view?.render(WypokFrontPageViewState.ARTICLES_LIST(frontPageItems))
    }
    
}

fileprivate extension FrontPageItemModel{
    func resetUserPreferences() -> FrontPageItemModel {
        self.isUpvoted = false
        self.isDownvoted = false
        self.isHidden = false
        return self
    }
}
