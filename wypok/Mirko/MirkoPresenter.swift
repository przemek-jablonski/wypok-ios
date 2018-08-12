//
//  MirkoPresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

protocol MirkoPresenter: Presenter {
    
    func onHotSelected()
    func onRecentsSelected()
    func onMirkoItemClicked(row: Int)
    func onMirkoItemForceTouched(row: Int)
    func onMirkoItemActionCalled(row: Int, action: MirkoItemAction)
    
}