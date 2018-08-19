//
//  WypokMirkoPresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokMirkoPresenter: BasePresenter<WypokMirkoViewState>, MirkoPresenter {
    
    private let interactor: MirkoInteractor
    private var mirkoItems: [MirkoItemModel] = [MirkoItemModel]()
    
    init(_ interactor: MirkoInteractor) {
        self.interactor = interactor
        super.init()
    }
    
    convenience override init() {
        self.init(WypokGlobalInjectionContainer.get(MirkoInteractor.self))
    }
    
    override func onAttached(view: View) {
        print("WypokFrontPagePresenter, onAttached: \(view)")
    }
    
    override func onDetached(view: View) {
        print("WypokFrontPagePresenter, onDetached: \(view)")
    }
    
    func onHotSelected() {
        print("onHotSelected")
        interactor.getMirkoHots { models in
            self.onMirkoHotItemsFetched(items: models)
        }
    }
    
    func onRecentsSelected() {
        print("onRecentsSelected")
        interactor.getMirkoRecents { models in
            self.onMirkoRecentItemsFetched(items: models)
        }
    }
    
    func onMirkoItemClicked(row: Int) {
        print("onMirkoItemClicked: \(row)")
        
    }
    
    func onMirkoItemForceTouched(row: Int) {
        print("onMirkoItemForceTouched: \(row)")
        
    }
    
    func onMirkoItemActionCalled(row: Int, action: MirkoItemAction) {
        print("onMirkoItemActionCalled: \(row), action: \(action)")
        
    }
    
    private func onMirkoRecentItemsFetched(items: [MirkoItemModel]) {
        print("onMirkoRecentItemsFetched: \(items)")
        mirkoItems = items
        view?.render(WypokMirkoViewState.RECENTS_LIST(mirkoItems))
    }
    
    private func onMirkoHotItemsFetched(items: [MirkoItemModel]) {
        print("onMirkoHotItemsFetched: \(items)")
        mirkoItems = items
        view?.render(WypokMirkoViewState.HOT_LIST(mirkoItems))
    }
    
    
}
