//
//  WypokFrontPagePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 24/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

//todo: remember that business logic should not be here really (so stuff like .resetUserPrefs should go to Interactor)
class WypokFrontPagePresenter : BasePresenter<WypokFrontPageViewState>, FrontPagePresenter {
    
    private let interactor: FrontPageInteractor
    private var frontPageItems: [FrontPageItemModel] = [FrontPageItemModel]()
    
    init(_ interactor: FrontPageInteractor) {
        self.interactor = interactor
        super.init()
    }

    override func onAttached(view: View) {
        interactor.getFrontPageItems { models in
            self.onFrontPageItemsFetched(items: models)
        }
    }
    
    private func onFrontPageItemsFetched(items: [FrontPageItemModel]) {
        frontPageItems = items
        view?.render(WypokFrontPageViewState.ARTICLES_LIST(frontPageItems))
    }
    
    override func onDetached(view: View) {
    }
    
    func onFrontPageItemClicked(row: Int) {
    }
    
    func onFrontPageItemForceTouchedClicked(row: Int) {
    }
    
    func onFrontPageItemActionCalled(row: Int, action: FrontPageItemAction) {
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
