//
//  MirkoDetailsPresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 08/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol MirkoDetailsPresenter: Presenter {
    
    func onSelectedEntryIdReceived(_ id: Int)
    
}
