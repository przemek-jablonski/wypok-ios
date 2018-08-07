//
//  FrontPagePresenter.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 26/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

protocol FrontPagePresenter: Presenter {
    
    func onFrontPageItemClicked(row: Int)
    func onFrontPageItemForceTouchedClicked(row: Int)
    func onFrontPageItemActionCalled(row: Int, action: FrontPageItemAction)
    
}
