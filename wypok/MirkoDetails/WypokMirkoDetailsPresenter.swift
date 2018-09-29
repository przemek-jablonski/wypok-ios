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
        self.view?.render(WypokMirkoDetailsViewState.loading)
    }
    
    override func onDetached(view: View) {
        
    }
    
    func onSelectedEntryIdReceived(_ id: Int) {
        interactor.getMirkoItemDetails(
            for: id,
            fetchDidSucceed: { model in
                self.view?.render(WypokMirkoDetailsViewState.content(model))
        }, fetchDidFailed: { error in
            self.view?.render(WypokMirkoDetailsViewState.error(message: self.generateMessage(from: error)))
        })
    }
    
    //todo: maybe those errors should be in MDI class? So that I can write MDI.Error?
    private func generateMessage(from error: MirkoDetailsInteractorError) -> String? {
        switch error {
        case .apiError(let code, let message):
            return message != nil ? message : String(code.rawValue)
        case .undefinedApiError(_):
            return "Undefined Error" //todo: ui string here
        case .generalError(_):
            return nil
        }
    }
    
}
