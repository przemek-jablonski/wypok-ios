//
//  WypokMirkoDetailsPresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 08/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokMirkoDetailsPresenter: BasePresenter<WypokMirkoDetailsViewState>, MirkoDetailsPresenter {
    
    private let interactor: MirkoDetailsInteractor
    
    init(interactor: MirkoDetailsInteractor) {
        self.interactor = interactor
    }
    
    override func onAttached(view: View) {
        
    }
    
    override func onDetached(view: View) {
        
    }
    
    func onSelectedEntryIdReceived(_ id: Int) {
        interactor.getMirkoItemDetails(
            for: id,
            fetchDidSucceed: { model in
                self.view?.render(WypokMirkoDetailsViewState.content(model))
        }, fetchDidFailed: { error in
            self.view?.render(WypokMirkoDetailsViewState.error(error))
        })
    }
    
}
