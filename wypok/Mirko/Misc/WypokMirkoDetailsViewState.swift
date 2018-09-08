//
//  WypokMirkoDetailsViewState.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 08/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

enum WypokMirkoDetailsViewState: ViewState {
    
    case ERROR
    case LOADING
    case CONTENT(model: [MirkoItemModel])
    
}
