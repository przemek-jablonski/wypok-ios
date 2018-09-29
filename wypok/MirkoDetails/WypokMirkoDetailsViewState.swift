//
//  WypokMirkoDetailsViewState.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 08/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

enum WypokMirkoDetailsViewState: ViewState {
    
    case error(message: String?)
    case loading
    case content(MirkoItemModel)
    
}
