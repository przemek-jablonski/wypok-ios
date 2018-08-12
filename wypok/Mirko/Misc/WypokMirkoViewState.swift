//
//  WypokMirkoViewState.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

//todo: is this ': ViewState' nessesary here? I recall there is render(viewstate: ANY) somewhere in code
enum WypokMirkoViewState: ViewState {
    case RECENTS_ERROR
    case RECENTS_LOADING
    case RECENTS_EMPTY_LIST
    case RECENTS_LIST([MirkoItemModel])
    
    case HOT_ERROR
    case HOT_LOADING
    case HOT_EMPTY_LIST
    case HOT_LIST([MirkoItemModel])
}
