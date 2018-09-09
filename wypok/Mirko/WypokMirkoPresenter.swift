//
//  WypokMirkoPresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokMirkoPresenter: BasePresenter<WypokMirkoViewState>, MirkoPresenter {
    
    private static let USER_APPROACHING_LIST_BOTTOM_ITEM_THRESHOLD = 7
    
    private let interactor: MirkoInteractor
    private var mirkoItems: [MirkoItemModel] = [MirkoItemModel]()
    private var userApproachedListBottom = false
    
    init(_ interactor: MirkoInteractor) {
        self.interactor = interactor
        super.init()
    }
    
    override func onAttached(view: View) {
        //todo: here presenter should ask view on which segmented control user is in (or set it from cache)
    }
    
    override func onDetached(view: View) {
    }
    
    func onHotSelected() {
        interactor.getMirkoHots(and: { models in
            self.onMirkoHotItemsFetched(items: models)
        }, fetchDidFailed:  { error in
            
        })
    }
    
    func onMirkoItemShownOnScreen(row: Int) {
        print("onMirkoItemShownOnScreen: \(row)")
        if (row >= mirkoItems.count - WypokMirkoPresenter.USER_APPROACHING_LIST_BOTTOM_ITEM_THRESHOLD && !userApproachedListBottom) {
            onUserApproachingListBottom()
        }
    }
    
    private func onUserApproachingListBottom() {
        print("onUserApproachingListBottom")
        userApproachedListBottom = true
        interactor.getMirkoHots(and: { models in
            self.onMirkoHotItemsFetched(items: models)
        }, fetchDidFailed:  { error in

        })
    }
    
    func onRecentsSelected() {
    }
    
    func onMirkoItemClicked(row: Int) {
    }
    
    func onMirkoItemForceTouched(row: Int) {
    }
    
    func onMirkoItemActionCalled(row: Int, action: MirkoItemAction) {
    }
    
    private func onMirkoRecentItemsFetched(items: [MirkoItemModel]) {
        mirkoItems.append(contentsOf: items) //todo: validation with ids
        render(.RECENTS_LIST(mirkoItems))
        userApproachedListBottom = false
    }
    
    private func onMirkoHotItemsFetched(items: [MirkoItemModel]) {
        mirkoItems.append(contentsOf: items) //todo: validation with ids
        render(.HOT_LIST(mirkoItems))
        userApproachedListBottom = false
    }
    
    
}
